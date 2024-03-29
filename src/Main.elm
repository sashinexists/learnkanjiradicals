module Main exposing (..)

--import Random.List exposing (..)

import Browser
import Browser.Dom as Dom exposing (Viewport)
import Browser.Events exposing (onKeyDown, onResize)
import Browser.Navigation as Nav
import Desktop
import Element exposing (..)
import Html.Attributes exposing (class)
import Json.Decode as D
import Multilingual
import Pages exposing (..)
import Phone
import Radical exposing (Radical)
import Radicals exposing (radicals)
import Random exposing (..)
import Random.List exposing (..)
import Routes exposing (Route(..))
import Shared exposing (..)
import Task exposing (Task)
import Url exposing (..)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


getRouteFromPath : String -> Route
getRouteFromPath path =
    case path of
        "/about" ->
            About

        "/ついて" ->
            About

        "/support" ->
            Support

        "/ありがとう" ->
            Support

        _ ->
            Home


type alias Flags =
    { x : Int
    , y : Int
    }


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        model : Model
        model =
            { key = key
            , url = url
            , radicals = radicals
            , selected = []
            , display = ListBySubject
            , route = getRouteFromPath url.path
            , device =
                classifyDevice
                    { height = flags.y
                    , width = flags.x
                    }
            , language = Multilingual.Ja
            }
    in
    ( model
    , Cmd.batch [ Task.perform GotViewport Dom.getViewport ]
    )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ onKeyDown keyDownListener
        , onResize WindowResized
        ]


decodeKey : D.Decoder String
decodeKey =
    D.field "key" D.string


keyDownListener : D.Decoder Msg
keyDownListener =
    D.map KeyDown decodeKey


classifyDevice : { window | height : Int, width : Int } -> Device
classifyDevice window =
    -- Tested in this ellie:
    -- https://ellie-app.com/68QM7wLW8b9a1
    { class =
        let
            longSide =
                max window.width window.height

            shortSide =
                min window.width window.height
        in
        if shortSide < 600 then
            Phone

        else if longSide <= 900 then
            Tablet

        else if longSide > 900 && longSide <= 1920 then
            Desktop

        else
            BigDesktop
    , orientation =
        if window.width < window.height then
            Portrait

        else
            Landscape
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.load (Url.toString url)
                    )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model
                | url = url
                , route = getRouteFromPath url.path
              }
            , Cmd.none
            )

        SelectRadical radical ->
            ( { model | selected = model.selected ++ [ radical ] }
            , Cmd.none
            )

        DeselectRadical radical ->
            deselectRadical model radical

        KeyDown key ->
            handleKeyDown key model

        DisplayBy option ->
            ( { model | display = option, route = Home }, Cmd.none )

        WindowResized width height ->
            ( { model | device = classifyDevice { height = height, width = width } }, Cmd.none )

        GotViewport data ->
            ( { model | device = classifyDevice { height = round data.viewport.height, width = round data.viewport.width } }, Cmd.none )

        Randomise ->
            ( model, Random.generate NewRadicalsList (Random.List.shuffle model.radicals) )

        NewRadicalsList radicals ->
            ( { model | radicals = radicals }, Cmd.none )

        ChangeLanguage language ->
            ( { model | language = language }, Cmd.none )


handleKeyDown : String -> Model -> ( Model, Cmd Msg )
handleKeyDown key model =
    case key of
        "Escape" ->
            ( { model | selected = [] }, Cmd.none )

        _ ->
            ( model, Cmd.none )


deselectRadical : Model -> Radical -> ( Model, Cmd Msg )
deselectRadical model radical =
    let
        selection =
            List.filter (\s -> radical /= s) model.selected
    in
    ( { model | selected = selection }, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    case model.device.class of
        Desktop ->
            Desktop.view model

        Phone ->
            Phone.view model

        Tablet ->
            Desktop.view model

        -- later you might want to make a view for tablets
        _ ->
            Desktop.view model

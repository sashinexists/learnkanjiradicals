module Main exposing (..)

import Browser
import Browser.Events exposing (onKeyDown, onResize)
import Browser.Navigation as Nav
import Desktop
import Element exposing (..)
import Json.Decode as D
import Pages exposing (..)
import Phone
import Radicals exposing (radicals)
import Routes exposing (Route(..))
import Shared exposing (..)
import Url exposing (..)


main : Program () Model Msg
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


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        model =
            { key = key
            , url = url
            , radicals = radicals
            , selected = Nothing
            , display = ListBySubject
            , route = getRouteFromPath url.path
            , device = { class = Desktop, orientation = Landscape }
            }
    in
    ( model, Cmd.none )


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
    Element.classifyDevice window


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
            ( { model | selected = Just radical }
            , Cmd.none
            )

        DeselectRadical ->
            deselectRadical model

        KeyDown key ->
            handleKeyDown key model

        DisplayBy option ->
            ( { model | display = option, route = Home }, Cmd.none )

        WindowResized height width ->
            ( { model | device = classifyDevice { height = height, width = width } }, Cmd.none )


handleKeyDown : String -> Model -> ( Model, Cmd Msg )
handleKeyDown key model =
    case key of
        "Escape" ->
            deselectRadical model

        _ ->
            ( model, Cmd.none )


deselectRadical : Model -> ( Model, Cmd Msg )
deselectRadical model =
    ( { model | selected = Nothing }, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    case model.device.class of
        Desktop ->
            Desktop.view model

        Phone ->
            Phone.view model

        Tablet ->
            Phone.view model

        -- later you might want to make a view for tablets
        _ ->
            Desktop.view model

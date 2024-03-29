module Shared exposing (..)

import Browser
import Browser.Dom as Dom exposing (Viewport)
import Browser.Navigation as Nav
import Element exposing (Device)
import Multilingual exposing (Code)
import Radical exposing (..)
import Routes exposing (..)
import Url exposing (Url)


type alias Model =
    { key : Nav.Key
    , url : Url
    , radicals : List Radical
    , selected : List Radical
    , display : Display
    , route : Route
    , device : Device
    , language : Code
    }


type Msg
    = SelectRadical Radical
    | DeselectRadical Radical
    | UrlChanged Url
    | LinkClicked Browser.UrlRequest
    | DisplayBy Display
    | KeyDown String
    | WindowResized Int Int
    | GotViewport Viewport
    | Randomise
    | NewRadicalsList (List Radical)
    | ChangeLanguage Multilingual.Code


type Display
    = ListBySubject
    | ListByPart
    | NoCategories

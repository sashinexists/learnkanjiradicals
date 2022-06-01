module Shared exposing (..)

import Browser
import Browser.Dom as Dom exposing (Viewport)
import Browser.Navigation as Nav
import Element exposing (Device)
import Radical exposing (..)
import Routes exposing (..)
import Url exposing (Url)


type alias Model =
    { key : Nav.Key
    , url : Url
    , radicals : List Radical
    , selected : Maybe Radical
    , display : Display
    , route : Route
    , device : Device
    }


type Msg
    = SelectRadical Radical
    | DeselectRadical
    | UrlChanged Url
    | LinkClicked Browser.UrlRequest
    | DisplayBy Display
    | KeyDown String
    | WindowResized Int Int
    | GotViewport Viewport


type Display
    = ListBySubject
    | ListByPart
    | NoCategories

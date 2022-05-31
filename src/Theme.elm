module Theme exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Markdown


colorPalette =
    { richBlack = rgb255 12 9 11
    , smokeyBlack = rgb255 23 18 21
    , raisinBlack = rgb255 31 27 31
    , raisinBlackLight = rgb255 35 46 41
    , combuGreen = rgb255 53 70 62
    , blackCoffee = rgb255 57 45 52
    , culturedWhite = rgb255 245 244 245
    , gainsboro = rgb255 227 221 224
    , darkSienna = rgb255 61 20 37
    , darkerSienner = rgb255 39 1 16
    , oldMauve = rgb255 92 30 56
    , spaceCadet = rgb255 44 40 62
    , englishViolet = rgb255 61 56 87
    }


theme =
    { fontColor = colorPalette.gainsboro
    , fontColorLighter = colorPalette.culturedWhite
    , bgColor = colorPalette.richBlack
    , contentBgColor = colorPalette.raisinBlack
    , contentBgColorDarker = colorPalette.smokeyBlack
    , contentBgColorLighter = colorPalette.blackCoffee
    , buttonBgColor = colorPalette.raisinBlackLight
    , buttonBgHover = colorPalette.combuGreen
    , buttonBgColorAlt = colorPalette.spaceCadet
    , buttonBgHoverAlt = colorPalette.englishViolet
    , textSize = 16
    }


focusBoxShadow : { color : Color, offset : ( number, number ), blur : number, size : Int }
focusBoxShadow =
    { color = theme.contentBgColorDarker, offset = ( 1, 5 ), blur = 8, size = 1 }


titleBarButtonStyles : List (Attr () msg)
titleBarButtonStyles =
    [ padding 25
    , alignRight
    , height fill
    , Background.color theme.contentBgColor
    , mouseOver [ Background.color theme.contentBgColorLighter, Font.color theme.fontColorLighter ]
    ]


markdownOptions : Markdown.Options
markdownOptions =
    { githubFlavored = Just { tables = True, breaks = True }
    , defaultHighlighting = Nothing
    , sanitize = False
    , smartypants = True
    }

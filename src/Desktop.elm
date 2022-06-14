module Desktop exposing (view)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border exposing (roundEach, rounded)
import Element.Font as Font
import Element.Input exposing (button)
import Html.Attributes
import Markdown
import Meaning exposing (displayMeaning)
import Pages exposing (Page, pages)
import Part exposing (Part, getJapanesePartName)
import Radical exposing (Radical)
import Routes exposing (Route(..))
import Shared exposing (..)
import Subject exposing (Subject, getJapaneseSubjectName)
import Theme exposing (..)


view : Model -> Browser.Document Msg
view model =
    { title = "Learn the Japanese Kanji Radicals"
    , body =
        [ layoutWith
            { options =
                [ focusStyle
                    (FocusStyle
                        (Just theme.contentBgColorLighter)
                        (Just theme.contentBgColorLighter)
                        (Just focusBoxShadow)
                    )
                ]
            }
            [ Font.family [ Font.typeface "Ubuntu" ]
            , Font.color theme.fontColor
            , Font.size theme.textSize
            , Font.regular
            , Font.justify
            , Background.color theme.bgColor
            ]
            (let
                styles =
                    [ paddingEach { top = 10, bottom = 10, left = 60, right = 50 }, width fill ]

                content =
                    [ viewHeader model.display
                    , case model.route of
                        Home ->
                            viewHomeRoute model

                        About ->
                            viewPage Pages.about

                        Support ->
                            viewPage Pages.support
                    ]
             in
             Element.column styles content
            )
        ]
    }


viewHomeRoute : Model -> Element Msg
viewHomeRoute model =
    Element.column
        [ centerX
        , centerY
        , Font.center
        , width fill
        , paddingEach { top = 10, bottom = 20, left = 0, right = 0 }
        ]
        [ case model.display of
            ListBySubject ->
                viewRadicalsBySubject model.selected model.radicals

            ListByPart ->
                viewRadicalsByPart model.selected model.radicals

            NoCategories ->
                viewRadicals model.selected model.radicals
        ]


viewPage : Page -> Element Msg
viewPage page =
    Element.column
        [ paddingEach { top = 20, bottom = 20, left = 0, right = 0 }, width fill ]
        [ Element.column
            [ centerX
            , centerY
            , Font.center
            , width <| px <| 800
            , Background.color theme.contentBgColor
            , rounded 10
            , padding 20
            ]
            [ viewTitle page.title
            , Element.el [ Font.alignLeft ] (Element.html (Markdown.toHtmlWith markdownOptions [ Html.Attributes.style "white-space" "normal", Html.Attributes.style "line-height" "30px" ] page.content))
            ]
        ]


viewHeader : Display -> Element Msg
viewHeader display =
    let
        styles =
            [ centerY, Font.size 25, spaceEvenly, Font.light, Font.alignRight, width fill, alignRight, height <| px <| 70 ]

        content =
            [ viewFilterButtons display
            , viewSiteTitle
            , viewHeaderLinks
            ]
    in
    Element.row styles content


viewFilterButtons : Display -> Element Msg
viewFilterButtons display =
    Element.row [ spacing 20 ]
        [ displayHeaderButton "主題" (DisplayBy ListBySubject) display
        , displayHeaderButton "部分" (DisplayBy ListByPart) display
        , displayHeaderButton "全部" (DisplayBy NoCategories) display
        , displayHeaderButton "混合" Randomise display
        ]


viewHeaderLinks : Element Msg
viewHeaderLinks =
    Element.row [ spacing 20, alpha 0 ]
        (List.map
            (\p -> viewHeaderLink p.title (Routes.getUrlFromRoute p.route))
            pages
        )


displayHeaderButton : String -> Msg -> Display -> Element Msg
displayHeaderButton label action display =
    case display of
        ListBySubject ->
            case action of
                DisplayBy ListBySubject ->
                    viewInactiveHeaderButton label

                _ ->
                    viewHeaderButton label action FilterButton

        ListByPart ->
            case action of
                DisplayBy ListByPart ->
                    viewInactiveHeaderButton label

                _ ->
                    viewHeaderButton label action FilterButton

        NoCategories ->
            case action of
                DisplayBy NoCategories ->
                    viewInactiveHeaderButton label

                _ ->
                    viewHeaderButton label action FilterButton


type HeaderButtonType
    = FilterButton
    | LinkButton


viewHeaderButton : String -> Msg -> HeaderButtonType -> Element Msg
viewHeaderButton label action buttonType =
    let
        ( bg, bgHover ) =
            case buttonType of
                FilterButton ->
                    ( theme.buttonBgColor, theme.buttonBgHover )

                LinkButton ->
                    ( theme.buttonBgColorAlt, theme.buttonBgHoverAlt )
    in
    button
        [ Background.color bg
        , rounded 10
        , padding 15
        , Font.size 18
        , Font.center
        , mouseOver [ Background.color bgHover, Font.color theme.fontColorLighter ]
        ]
        { label = Element.text label
        , onPress = Just action
        }


viewHeaderLink : String -> String -> Element Msg
viewHeaderLink label url =
    Element.link
        [ Background.color theme.buttonBgColorAlt
        , rounded 10
        , padding 15
        , Font.size 18
        , Font.center
        , mouseOver [ Background.color theme.buttonBgHoverAlt, Font.color theme.fontColorLighter ]
        ]
        { label = Element.text label
        , url = url
        }


viewInactiveHeaderButton : String -> Element Msg
viewInactiveHeaderButton label =
    Element.el
        [ Background.color theme.buttonBgColor
        , rounded 10
        , padding 15
        , Font.size 18
        , Font.center
        , alpha 0.75
        ]
        (Element.text label)


viewSiteTitle : Element Msg
viewSiteTitle =
    Element.text "漢字の部首学ぶ教室へようこそ！！"


viewTitle : String -> Element Msg
viewTitle title =
    Element.el [ Font.extraLight, Font.size 50, paddingEach { top = 20, bottom = 20, right = 0, left = 10 } ] (Element.text title)


viewRadicals : List Radical -> List Radical -> Element Msg
viewRadicals selected radicals =
    let
        content =
            List.map (viewRadical selected) radicals
    in
    Element.wrappedRow
        [ spacing 20
        , width fill
        ]
        content


viewRadicalsBySubject : List Radical -> List Radical -> Element Msg
viewRadicalsBySubject selected radicals =
    Element.column []
        (List.map
            (viewSubjectRadicals selected radicals)
            Subject.all
        )


viewRadicalsByPart : List Radical -> List Radical -> Element Msg
viewRadicalsByPart selected radicals =
    Element.column []
        (List.map
            (viewPartRadicals selected radicals)
            Part.all
        )


viewSubjectRadicals : List Radical -> List Radical -> Subject -> Element Msg
viewSubjectRadicals selected radicals subject =
    Element.column [ paddingEach { top = 10, bottom = 20, left = 0, right = 0 } ]
        [ viewTitle (getJapaneseSubjectName subject)
        , viewRadicals selected (List.filter (\r -> r.subject == subject) radicals)
        ]


viewPartRadicals : List Radical -> List Radical -> Part -> Element Msg
viewPartRadicals selected radicals part =
    Element.column [ paddingEach { top = 10, bottom = 20, left = 0, right = 0 } ]
        [ viewTitle (getJapanesePartName part)
        , viewRadicals selected (List.filter (\r -> r.part == part) radicals)
        ]


viewRadical : List Radical -> Radical -> Element Msg
viewRadical selected radical =
    if List.any (\selectedRadical -> selectedRadical == radical) selected then
        viewSelectedRadical radical

    else
        viewUnselectedRadical radical


viewUnselectedRadical : Radical -> Element Msg
viewUnselectedRadical radical =
    button
        [ Background.color theme.contentBgColor
        , rounded 10
        , width <| px <| 320
        , height <| px <| 200
        , Font.size 50
        , Font.center
        , mouseOver [ Background.color theme.contentBgColorLighter, Font.color theme.fontColorLighter ]
        ]
        { label =
            Element.column [ Font.center, centerX, centerY, spacing 20 ]
                [ Element.el [ Font.center, centerX, centerY ] (text (String.fromChar radical.radical))
                ]
        , onPress = Just (SelectRadical radical)
        }


viewSelectedRadical : Radical -> Element Msg
viewSelectedRadical radical =
    button
        [ Background.color theme.contentBgColor
        , rounded 10
        , width <| px <| 320
        , height <| px <| 200
        , Font.size 50
        , Font.center
        , mouseOver [ Background.color theme.contentBgColorLighter, Font.color theme.fontColorLighter ]
        ]
        { label =
            Element.row [ Font.center, centerX, centerY, spacing 20 ]
                [ Element.el [ Font.center, Font.light, centerX, centerY ] (text (String.fromChar radical.radical))
                , Element.column [ spacing 10 ]
                    [ viewRadicalAttribute "名前" radical.name
                    , viewRadicalAttribute "意味" (displayMeaning radical.meaning)
                    , viewRadicalAttribute "部分" (getJapanesePartName radical.part)
                    ]
                ]
        , onPress = Just (DeselectRadical radical)
        }


viewRadicalAttribute : String -> String -> Element Msg
viewRadicalAttribute attribute value =
    Element.row
        [ centerX
        , centerY
        , height (fillPortion 1)
        , width fill
        , Font.alignLeft
        , Font.size 14
        ]
        [ Element.el
            [ centerY
            , Font.bold
            ]
            (text (attribute ++ ": "))
        , Element.el
            [ centerY
            ]
            (text value)
        ]

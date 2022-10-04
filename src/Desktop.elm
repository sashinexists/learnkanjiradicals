module Desktop exposing (view)

import Browser
import Copy
import Element exposing (..)
import Element.Background as Background
import Element.Border exposing (roundEach, rounded)
import Element.Font as Font
import Element.Input exposing (button)
import Html.Attributes
import Markdown
import Meaning exposing (displayMeaning)
import Multilingual
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
                    [ viewHeader model.language model.display
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
                viewRadicalsBySubject model.language model.selected model.radicals

            ListByPart ->
                viewRadicalsByPart model.language model.selected model.radicals

            NoCategories ->
                viewRadicals model.language model.selected model.radicals
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


viewHeader : Multilingual.Code -> Display -> Element Msg
viewHeader language display =
    let
        styles =
            [ centerY, Font.size 25, spaceEvenly, Font.light, Font.alignRight, width fill, alignRight, height <| px <| 70 ]

        content =
            [ viewFilterButtons language display
            , viewSiteTitle language
            , viewHeaderLinks language
            ]
    in
    Element.row styles content


viewFilterButtons : Multilingual.Code -> Display -> Element Msg
viewFilterButtons language display =
    Element.row [ spacing 20 ]
        [ displayHeaderButton (Multilingual.toString language Copy.subjectsButton) (DisplayBy ListBySubject) display
        , displayHeaderButton (Multilingual.toString language Copy.partsButton) (DisplayBy ListByPart) display
        , displayHeaderButton (Multilingual.toString language Copy.allButton) (DisplayBy NoCategories) display
        , displayHeaderButton (Multilingual.toString language Copy.randomiseButton) Randomise display
        ]


viewHeaderLinks : Multilingual.Code -> Element Msg
viewHeaderLinks currentLanguage =
    Element.row [ spacing 20 ]
        --List.map
        -- (\p -> viewHeaderLink p.title (Routes.getUrlFromRoute p.route))
        --pages
        --++
        [ viewChangeLanguageButton currentLanguage ]


viewChangeLanguageButton : Multilingual.Code -> Element Msg
viewChangeLanguageButton currentLanguage =
    button
        [ Background.color theme.buttonBgColorAlt
        , rounded 10
        , padding 15
        , Font.size 18
        , Font.center
        , mouseOver [ Background.color theme.buttonBgHoverAlt, Font.color theme.fontColorLighter ]
        ]
        { label = Element.text (Multilingual.toString currentLanguage Copy.languageButton)
        , onPress = Just (ChangeLanguage (switchLanguage currentLanguage))
        }


switchLanguage : Multilingual.Code -> Multilingual.Code
switchLanguage currentLanguage =
    if currentLanguage == Multilingual.Ja then
        Multilingual.En

    else
        Multilingual.Ja


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


viewSiteTitle : Multilingual.Code -> Element Msg
viewSiteTitle language =
    Element.text (Multilingual.toString language Copy.siteTitle)


viewTitle : String -> Element Msg
viewTitle title =
    Element.el [ Font.extraLight, Font.size 50, paddingEach { top = 20, bottom = 20, right = 0, left = 10 } ] (Element.text title)


viewRadicals : Multilingual.Code -> List Radical -> List Radical -> Element Msg
viewRadicals language selected radicals =
    let
        content =
            List.map (viewRadical language selected) radicals
    in
    Element.wrappedRow
        [ spacing 20
        , width fill
        ]
        content


viewRadicalsBySubject : Multilingual.Code -> List Radical -> List Radical -> Element Msg
viewRadicalsBySubject language selected radicals =
    Element.column []
        (List.map
            (viewSubjectRadicals language selected radicals)
            Subject.all
        )


viewRadicalsByPart : Multilingual.Code -> List Radical -> List Radical -> Element Msg
viewRadicalsByPart language selected radicals =
    Element.column []
        (List.map
            (viewPartRadicals language selected radicals)
            Part.all
        )


viewSubjectRadicals : Multilingual.Code -> List Radical -> List Radical -> Subject -> Element Msg
viewSubjectRadicals language selected radicals subject =
    Element.column [ paddingEach { top = 10, bottom = 20, left = 0, right = 0 } ]
        [ viewTitle (Multilingual.toString language (Copy.getSubjectName subject))
        , viewRadicals language selected (List.filter (\r -> r.subject == subject) radicals)
        ]


viewPartRadicals : Multilingual.Code -> List Radical -> List Radical -> Part -> Element Msg
viewPartRadicals language selected radicals part =
    Element.column [ paddingEach { top = 10, bottom = 20, left = 0, right = 0 } ]
        [ viewTitle (Multilingual.toString language (Copy.getPartName part))
        , viewRadicals language selected (List.filter (\r -> r.part == part) radicals)
        ]


viewRadical : Multilingual.Code -> List Radical -> Radical -> Element Msg
viewRadical language selected radical =
    if List.any (\selectedRadical -> selectedRadical == radical) selected then
        viewSelectedRadical language radical

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


viewSelectedRadical : Multilingual.Code -> Radical -> Element Msg
viewSelectedRadical language radical =
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
                    [ viewRadicalAttribute (Multilingual.toString language Copy.radicalName) (Multilingual.toString language radical.name)
                    , viewRadicalAttribute (Multilingual.toString language Copy.radicalMeaning) (Multilingual.toString language (displayMeaning  radical.meaning))
                    , viewRadicalAttribute (Multilingual.toString language Copy.radicalPart) (Multilingual.toString language (Copy.getPartName radical.part))
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

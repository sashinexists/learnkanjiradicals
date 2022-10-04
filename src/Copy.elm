module Copy exposing (..)

import Multilingual exposing (Multilingual)
import Part exposing (Part(..))
import Subject exposing (Subject(..))



-- after that you'll actually have to make Radicals.elm multilingual
-- actually next up maybe you should add a button that changes the model's language


siteTitle : Multilingual
siteTitle =
    Multilingual.Multilingual
        "漢字の部首学ぶ教室へようこそ！！"
        [ ( Multilingual.Ja, "漢字の部首学ぶ教室へようこそ！！" )

        --, ( Multilingual.En, "Welcome to the Kanji Radicals Classroom!" )
        , ( Multilingual.En, "Learn Kanji Radicals" )
        ]


partsButton : Multilingual
partsButton =
    Multilingual.Multilingual
        "部分"
        [ ( Multilingual.Ja, "部分" )
        , ( Multilingual.En, "By Part" )
        ]


subjectsButton : Multilingual
subjectsButton =
    Multilingual.Multilingual
        "主題"
        [ ( Multilingual.Ja, "主題" )
        , ( Multilingual.En, "By Subject" )
        ]


allButton : Multilingual
allButton =
    Multilingual.Multilingual
        "全部"
        [ ( Multilingual.Ja, "全部" )
        , ( Multilingual.En, "No Categories" )
        ]


randomiseButton : Multilingual
randomiseButton =
    Multilingual.Multilingual
        "混合"
        [ ( Multilingual.Ja, "混合" )
        , ( Multilingual.En, "Randomise" )
        ]


aboutButton : Multilingual
aboutButton =
    Multilingual.Multilingual
        "このアプリについて"
        [ ( Multilingual.Ja, "このアプリについて" )
        , ( Multilingual.En, "About" )
        ]


languageButton : Multilingual
languageButton =
    Multilingual.Multilingual
        "英語で使いたいですか？"
        [ ( Multilingual.Ja, "🇬🇧 英語で使いたいですか？" )
        , ( Multilingual.En, "🇯🇵 Switch to Japanese?" )
        ]


radicalName : Multilingual
radicalName =
    Multilingual.Multilingual
        "名前"
        [ ( Multilingual.Ja, "名前" )
        , ( Multilingual.En, "Name" )
        ]


radicalMeaning : Multilingual
radicalMeaning =
    Multilingual.Multilingual
        "意味"
        [ ( Multilingual.Ja, "意味" )
        , ( Multilingual.En, "Meaning" )
        ]


radicalPart : Multilingual
radicalPart =
    Multilingual.Multilingual
        "部分"
        [ ( Multilingual.Ja, "部分" )
        , ( Multilingual.En, "Position" )
        ]


getPartName : Part -> Multilingual
getPartName part =
    case part of
        Left ->
            Multilingual.Multilingual
                "へん"
                [ ( Multilingual.Ja, "へん" )
                , ( Multilingual.En, "Left" )
                ]

        Right ->
            Multilingual.Multilingual
                "つくり"
                [ ( Multilingual.Ja, "つくり" )
                , ( Multilingual.En, "Right" )
                ]

        Top ->
            Multilingual.Multilingual
                "かんむり"
                [ ( Multilingual.Ja, "かんむり" )
                , ( Multilingual.En, "Crown (Top)" )
                ]

        Bottom ->
            Multilingual.Multilingual
                "あし"
                [ ( Multilingual.Ja, "あし" )
                , ( Multilingual.En, "Legs (Bottom)" )
                ]

        Enclose ->
            Multilingual.Multilingual
                "かまえ"
                [ ( Multilingual.Ja, "かまえ" )
                , ( Multilingual.En, "Enclose" )
                ]

        Hang ->
            Multilingual.Multilingual
                "たれ"
                [ ( Multilingual.Ja, "たれ" )
                , ( Multilingual.En, "Hang" )
                ]

        Wrap ->
            Multilingual.Multilingual
                "にょう"
                [ ( Multilingual.Ja, "にょう" )
                , ( Multilingual.En, "Wrap" )
                ]

        None ->
            Multilingual.Multilingual
                "なし"
                [ ( Multilingual.Ja, "なし" )
                , ( Multilingual.En, "N/A" )
                ]


getSubjectName : Subject -> Multilingual
getSubjectName subject =
    case subject of
        Nature ->
            Multilingual.Multilingual
                "自然"
                [ ( Multilingual.Ja, "自然" )
                , ( Multilingual.En, "Nature" )
                ]

        BodyParts ->
            Multilingual.Multilingual
                "身体部位"
                [ ( Multilingual.Ja, "身体部位" )
                , ( Multilingual.En, "Body Parts" )
                ]

        People ->
            Multilingual.Multilingual
                "人"
                [ ( Multilingual.Ja, "人" )
                , ( Multilingual.En, "People" )
                ]

        Enclosures ->
            Multilingual.Multilingual
                "環境"
                [ ( Multilingual.Ja, "環境" )
                , ( Multilingual.En, "Enclosures" )
                ]

        VerbsAndLanguage ->
            Multilingual.Multilingual
                "動詞と言語"
                [ ( Multilingual.Ja, "動詞と言語" )
                , ( Multilingual.En, "Verbs and Language" )
                ]

        NaturalMaterials ->
            Multilingual.Multilingual
                "自然材料"
                [ ( Multilingual.Ja, "自然材料" )
                , ( Multilingual.En, "Natural Materials" )
                ]

        MathAndMeasurement ->
            Multilingual.Multilingual
                "数学と測定"
                [ ( Multilingual.Ja, "数学と測定" )
                , ( Multilingual.En, "Math and Measurement" )
                ]

        Food ->
            Multilingual.Multilingual
                "食物"
                [ ( Multilingual.Ja, "食物" )
                , ( Multilingual.En, "Food" )
                ]

        Animals ->
            Multilingual.Multilingual
                "動物"
                [ ( Multilingual.Ja, "動物" )
                , ( Multilingual.En, "Animals" )
                ]

        Warfare ->
            Multilingual.Multilingual
                "戦争"
                [ ( Multilingual.Ja, "戦争" )
                , ( Multilingual.En, "Warfare" )
                ]

        ManMadeTools ->
            Multilingual.Multilingual
                "人間製のツール"
                [ ( Multilingual.Ja, "人間製のツール" )
                , ( Multilingual.En, "Man-Made Tools" )
                ]

        --can improve this
        Senses ->
            Multilingual.Multilingual
                "感覚"
                [ ( Multilingual.Ja, "感覚" )
                , ( Multilingual.En, "Senses" )
                ]

        Supernatural ->
            Multilingual.Multilingual
                "超自然"
                [ ( Multilingual.Ja, "超自然" )
                , ( Multilingual.En, "Supernatural" )
                ]

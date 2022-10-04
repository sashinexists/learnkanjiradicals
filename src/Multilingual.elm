module Multilingual exposing (..)

import Tuple exposing (first)


type alias Multilingual =
    { copy : String, translations : List ( Code, String ) }


toString : Code -> Multilingual -> String
toString language multilingual =
    List.filter (\( code, _ ) -> code == language) multilingual.translations |> List.head |> Maybe.withDefault ( language, "failed" ) |> Tuple.second


type Code
    = Bg -- Bulgarian
    | Cs -- Czech
    | Da -- Danish
    | De -- German
    | El -- Greek
    | En -- English
    | Es -- Spanish
    | Et -- Estonian
    | Fi -- Finish
    | Fr -- French
    | Ga -- Irish
    | He -- Hebrew
    | Hr -- Croatian
    | Hu -- Hungarian
    | Hy -- Armenian
    | It -- Italian
    | Ja -- Japanese
    | Ka -- Georgian
    | Ko -- Korean
    | Lt -- Lithuanian
    | Lv -- Latvian
    | Mt -- Maltese
    | Nl -- Dutch
    | No -- Norwegian
    | Pl -- Polish
    | Pt -- Portuguese
    | Ro -- Romanian
    | Ru -- Russian
    | Sk -- Slovak
    | Sl -- Slovenian
    | Sr -- Serbian
    | Sv -- Swedish
    | Tr -- Turkish
    | Uk -- Ukrainian
    | Zh -- Chinese
    | Zu -- Zulu

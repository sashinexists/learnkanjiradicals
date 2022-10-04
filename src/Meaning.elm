module Meaning exposing (..)
import Multilingual exposing (..)

type Meaning
    = Same
    | Different Multilingual



--you need to turn string here to a multilingual


displayMeaning : Meaning -> Multilingual
displayMeaning meaning =
    case meaning of
        Same ->
            {
                copy= "名前と同じ",
                translations = [(En, "Same as name"), (Ja, "名前と同じ")]
            }

        Different m ->
            m

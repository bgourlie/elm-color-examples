module Ui.Slider exposing (slider)

import Html exposing (Html, div, input, text)
import Html.Attributes as Attr exposing (type', value, min, max)
import Html.Events exposing (onInput)


slider : (String -> msg) -> Int -> Int -> Int -> Html msg
slider changeHandler minVal maxVal curVal =
    div []
        [ input
            [ type' "range"
            , onInput changeHandler
            , value <| toString curVal
            , Attr.min <| toString minVal
            , Attr.max <| toString maxVal
            ]
            []
        , input
            [ type' "number"
            , onInput changeHandler
            , value <| toString curVal
            , Attr.min <| toString minVal
            , Attr.max <| toString maxVal
            ]
            [ text (toString curVal) ]
        ]

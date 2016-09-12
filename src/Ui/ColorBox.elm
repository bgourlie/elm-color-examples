module Ui.ColorBox exposing (colorBox)

import Html exposing (Html, div)
import Color exposing (toRgb)
import Html.Attributes
import Ui.Styles exposing (styles, colorBoxStyles, checkerboardStyles, colorDisplayStyles)


colorBox : Color.Color -> Html msg
colorBox color =
    div [ styles colorBoxStyles ]
        [ div [ styles checkerboardStyles ] []
        , div [ styles (colorDisplayStyles color) ] []
        ]

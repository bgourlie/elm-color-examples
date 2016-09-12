module Ui.ColorBox exposing (colorBox)

import Html exposing (Html, div)
import Color exposing (toRgb)
import Ui.Styles exposing (class, styles, colorDisplayInlineStyles, CssClasses(ColorBox, Checkerboard, ColorDisplay))


colorBox : Color.Color -> Html msg
colorBox color =
    div [ class [ ColorBox ] ]
        [ div [ class [ Checkerboard ] ] []
        , div
            [ class [ ColorDisplay ]
            , styles <| colorDisplayInlineStyles color
            ]
            []
        ]

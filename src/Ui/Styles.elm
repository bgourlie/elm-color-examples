module Ui.Styles exposing (class, styles, css, colorDisplayInlineStyles, CssClasses(ColorPicker, ColorBox, Checkerboard, ColorDisplay))

import Html.Attributes
import Color
import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)
import Html.CssHelpers


myNamespace =
    "elmColorExamples"


{ id, class, classList } =
    Html.CssHelpers.withNamespace myNamespace
type CssClasses
    = ColorPicker
    | ColorBox
    | ColorDisplay
    | Checkerboard


checkerboardData =
    "url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAJUlEQVQYV2NkYGD4z4AJGNGFQAJDQSEWv2C6G8N3UF0YHhxAhQBLjgoGdiBmhAAAAABJRU5ErkJggg==) repeat"


css =
    (stylesheet << namespace myNamespace)
        [ body []
        , (.) ColorPicker [ padding <| px 10 ]
        , (.) ColorBox
            [ width <| px 100
            , height <| px 100
            , position relative
            , children
                [ (.) Checkerboard
                    [ width <| pct 100
                    , height <| pct 100
                    , property "background" checkerboardData
                    , position absolute
                    ]
                , (.) ColorDisplay
                    [ width <| pct 100
                    , height <| pct 100
                    , position absolute
                    ]
                ]
            ]
        ]


colorDisplayInlineStyles : Color.Color -> List Mixin
colorDisplayInlineStyles color =
    let
        { red, green, blue, alpha } =
            Color.toRgb color
    in
        [ backgroundColor <| rgba red green blue alpha ]


styles =
    Css.asPairs >> Html.Attributes.style

module Ui.Styles exposing (..)

import Html.Attributes
import Color
import Css exposing (..)
import Css.Elements exposing (body, li)
import Css.Namespace exposing (namespace)


type CssClasses
    = NavBar


type CssIds
    = Page


css =
    (stylesheet << namespace "dreamwriter")
        [ body
            [ overflowX auto
            , minWidth (px 1280)
            ]
        , (#) Page
            [ backgroundColor (rgb 200 128 64)
            , color (hex "CCFFFF")
            , width (pct 100)
            , height (pct 100)
            , boxSizing borderBox
            , padding (px 8)
            , margin zero
            ]
        , (.) NavBar
            [ margin zero
            , padding zero
            , children
                [ li
                    [ (display inlineBlock) |> important
                    , color primaryAccentColor
                    ]
                ]
            ]
        ]


primaryAccentColor =
    hex "ccffaa"


colorPickerStyles : List Mixin
colorPickerStyles =
    [ padding <| px 10 ]


colorBoxStyles : List Mixin
colorBoxStyles =
    [ width <| px 100
    , height <| px 100
    , position relative
    ]


colorDisplayStyles : Color.Color -> List Mixin
colorDisplayStyles color =
    let
        { red, green, blue, alpha } =
            Color.toRgb color
    in
        [ height <| pct 100
        , width <| pct 100
        , backgroundColor <| rgba red green blue alpha
        , position absolute
        ]


checkerboardStyles : List Mixin
checkerboardStyles =
    [ width <| pct 100
    , height <| pct 100
    , property "background" "url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAJUlEQVQYV2NkYGD4z4AJGNGFQAJDQSEWv2C6G8N3UF0YHhxAhQBLjgoGdiBmhAAAAABJRU5ErkJggg==) repeat"
    , position absolute
    ]


styles =
    Css.asPairs >> Html.Attributes.style

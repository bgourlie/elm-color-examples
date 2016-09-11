module ColorPicker exposing (colorPicker)

import String
import ColorBox exposing (colorBox)
import Html exposing (Html, Attribute, div, text, input, button, label)
import Html.Attributes as Attrs exposing (style, type', value, min, max)
import Html.Events exposing (onInput)
import Color exposing (Color, toRgb, rgba)
import Styles exposing (styles, colorPickerStyles)


colorPicker : (Color -> msg) -> Color -> Html msg
colorPicker msg curColor =
    let
        { red, green, blue, alpha } =
            toRgb curColor
    in
        div [ styles colorPickerStyles ]
            [ slider (redUpdated msg curColor) 0 255 red
            , slider (greenUpdated msg curColor) 0 255 green
            , slider (blueUpdated msg curColor) 0 255 blue
            , slider (alphaUpdated msg curColor) 0 100 (round (alpha * 100))
            , colorBox curColor
            ]


slider : (String -> msg) -> Int -> Int -> Int -> Html msg
slider changeHandler minVal maxVal curVal =
    div []
        [ input
            [ type' "range"
            , onInput changeHandler
            , value <| toString curVal
            , Attrs.min <| toString minVal
            , Attrs.max <| toString maxVal
            ]
            []
        , input
            [ type' "number"
            , onInput changeHandler
            , value <| toString curVal
            , Attrs.min <| toString minVal
            , Attrs.max <| toString maxVal
            ]
            [ text (toString curVal) ]
        ]


redUpdated : (Color -> msg) -> Color -> String -> msg
redUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newRed =
            stringToInt v
    in
        msg <| rgba newRed curRgb.green curRgb.blue curRgb.alpha


greenUpdated : (Color -> msg) -> Color -> String -> msg
greenUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newGreen =
            stringToInt v
    in
        msg <| rgba curRgb.red newGreen curRgb.blue curRgb.alpha


blueUpdated : (Color -> msg) -> Color -> String -> msg
blueUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newBlue =
            stringToInt v
    in
        msg <| rgba curRgb.red curRgb.green newBlue curRgb.alpha


alphaUpdated : (Color -> msg) -> Color -> String -> msg
alphaUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newAlpha =
            stringToInt v
    in
        msg <| rgba curRgb.red curRgb.green curRgb.blue ((toFloat newAlpha) / 100)


stringToInt : String -> Int
stringToInt val =
    String.toInt val |> Result.withDefault 0

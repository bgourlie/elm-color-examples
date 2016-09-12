module Ui.ColorPicker exposing (colorPicker)

import String
import Ui.ColorBox exposing (colorBox)
import Html exposing (Html, Attribute, div, text, input, button, label)
import Color exposing (Color, toRgb, rgba)
import Ui.Styles exposing (styles, colorPickerStyles)
import Ui.Slider exposing (slider)
import Ui.Util exposing (stringToInt)


colorPicker : (Color -> msg) -> Color -> Html msg
colorPicker msg curColor =
    let
        { red, green, blue, alpha } =
            toRgb curColor
    in
        div [ styles colorPickerStyles ]
            [ colorBox curColor
            , slider (redUpdated msg curColor) 0 255 red
            , slider (greenUpdated msg curColor) 0 255 green
            , slider (blueUpdated msg curColor) 0 255 blue
            , slider (alphaUpdated msg curColor) 0 100 (round (alpha * 100))
            ]


redUpdated : (Color -> msg) -> Color -> String -> msg
redUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newRed =
            stringToInt 0 v
    in
        msg <| rgba newRed curRgb.green curRgb.blue curRgb.alpha


greenUpdated : (Color -> msg) -> Color -> String -> msg
greenUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newGreen =
            stringToInt 0 v
    in
        msg <| rgba curRgb.red newGreen curRgb.blue curRgb.alpha


blueUpdated : (Color -> msg) -> Color -> String -> msg
blueUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newBlue =
            stringToInt 0 v
    in
        msg <| rgba curRgb.red curRgb.green newBlue curRgb.alpha


alphaUpdated : (Color -> msg) -> Color -> String -> msg
alphaUpdated msg curColor v =
    let
        curRgb =
            toRgb curColor

        newAlpha =
            stringToInt 0 v
    in
        msg <| rgba curRgb.red curRgb.green curRgb.blue ((toFloat newAlpha) / 100)
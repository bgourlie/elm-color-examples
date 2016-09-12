module Main exposing (..)

import Html exposing (Html, Attribute, div, text, input, button, label, p)
import Html.App as App
import Html.Attributes as Attrs exposing (style, type', value, min, max)
import Color exposing (Color, toRgb)
import Json.Decode as Json
import ColorPicker exposing (colorPicker)
import ColorBox exposing (colorBox)
import Slider exposing (slider)
import Util exposing (stringToInt)
import Color.Manipulate exposing (weightedMix)


main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { mixInputColor1 : Color
    , mixInputColor2 : Color
    , mixInputWeight : Int
    }


init : ( Model, Cmd AppMessage )
init =
    ( { mixInputColor1 = Color.darkBlue, mixInputColor2 = Color.purple, mixInputWeight = 50 }, Cmd.none )



-- UPDATE


type AppMessage
    = InputColor1Changed Color
    | InputColor2Changed Color
    | InputWeightChanged Int
    | NoOp


update : AppMessage -> Model -> ( Model, Cmd AppMessage )
update msg model =
    case msg of
        InputColor1Changed color ->
            ( { model | mixInputColor1 = color }, Cmd.none )

        InputColor2Changed color ->
            ( { model | mixInputColor2 = color }, Cmd.none )

        InputWeightChanged weight ->
            ( { model | mixInputWeight = weight }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub AppMessage
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html AppMessage
view model =
    div []
        [ p [] [ text "Color One" ]
        , colorPicker InputColor1Changed model.mixInputColor1
        , p [] [ text "Color Two" ]
        , colorPicker InputColor2Changed model.mixInputColor2
        , p [] [ text "Scale" ]
        , slider (\v -> InputWeightChanged (stringToInt 0 v)) 0 100 model.mixInputWeight
        , p [] [ text "Mixed" ]
        , colorBox <| weightedMix model.mixInputColor1 model.mixInputColor2 ((toFloat model.mixInputWeight) / 100)
        ]

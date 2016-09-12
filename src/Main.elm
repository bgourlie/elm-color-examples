module Main exposing (..)

import Html exposing (Html, div, text, p)
import Html.App as App
import Color exposing (Color, toRgb)
import Ui.ColorPicker exposing (colorPicker)
import Ui.ColorBox exposing (colorBox)
import Ui.Slider exposing (slider)
import Ui.Util exposing (stringToInt, percentToFloat)
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
        , colorBox <| weightedMix model.mixInputColor1 model.mixInputColor2 (percentToFloat model.mixInputWeight)
        ]

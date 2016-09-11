module Main exposing (..)

import Html exposing (Html, Attribute, div, text, input, button, label)
import Html.App as App
import Html.Attributes as Attrs exposing (style, type', value, min, max)
import Color exposing (Color, toRgb)
import Json.Decode as Json
import ColorPicker exposing (colorPicker)


main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { inputColor1 : Color
    , inputColor2 : Color
    }


init : ( Model, Cmd AppMessage )
init =
    ( { inputColor1 = Color.darkBlue, inputColor2 = Color.purple }, Cmd.none )



-- UPDATE


type AppMessage
    = InputColor1Changed Color
    | InputColor2Changed Color
    | NoOp


update : AppMessage -> Model -> ( Model, Cmd AppMessage )
update msg model =
    case msg of
        InputColor1Changed color ->
            ( { model | inputColor1 = color }, Cmd.none )

        InputColor2Changed color ->
            ( { model | inputColor2 = color }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub AppMessage
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html AppMessage
view model =
    div []
        [ colorPicker InputColor1Changed model.inputColor1
        , colorPicker InputColor2Changed model.inputColor2
        ]

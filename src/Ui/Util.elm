module Ui.Util exposing (..)

import String


stringToInt : Int -> String -> Int
stringToInt default val =
    String.toInt val |> Result.withDefault default

percentToFloat : Int -> Float
percentToFloat pct =
    (toFloat pct) / 100
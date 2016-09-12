module Util exposing (..)

import String


stringToInt : Int -> String -> Int
stringToInt default val =
    String.toInt val |> Result.withDefault default

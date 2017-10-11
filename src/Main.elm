module Main exposing (main)

import Html
import Types exposing (Model, Msg)
import Update exposing (update)
import View exposing (view)


initialModel : Model
initialModel =
    0


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }

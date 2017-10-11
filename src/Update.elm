module Update exposing (..)

import Types exposing (Model, Msg(Incr, Decr))


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Incr ->
            (model + 1) ! []

        Decr ->
            (model - 1) ! []

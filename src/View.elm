module View exposing (..)

-- Keep your main view function clean, moving large chunks of your code to smaller readable and reusable view components

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (Model, Msg(Incr, Decr))


-- MAIN VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ header
        , counter model
        , footer
        ]



-- VIEW COMPONENTS


header : Html msg
header =
    div []
        [ h1 []
            [ img [ src "images/logo.png" ] []
            , text "Elm Webpack Starter, featuring hot-loading"
            ]
        , p [] [ text "Click on buttons below to increment the state." ]
        ]


counter : Model -> Html Msg
counter model =
    div []
        [ button
            [ class "btn btn-primary"
            , onClick Incr
            ]
            [ text "+ 1" ]
        , text <| toString model
        , button
            [ class "btn btn-danger"
            , onClick Decr
            ]
            [ text "+ 1" ]
        ]


footer : Html msg
footer =
    div []
        [ p [] [ text "Then make a change to the source code and see how the state is retained after you recompile." ]
        , p []
            [ text "And now don't forget to add a star to the Github repo "
            , a [ href "https://github.com/welf/elm-webpack-starter" ] [ text "elm-webpack-starter" ]
            ]
        ]



-- HELPER FUNCTIONS

module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, update = update, view = view }



-- MODEL


type alias Model =
    { name : String
    , email : String
    , password : String
    , rePassword : String
    }


initialModel : Model
initialModel =
    Model "" "" "" ""



-- UPDATE


type Msg
    = Name String
    | Email String
    | Password String
    | RePassword String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }

        Email email ->
            { model | email = email }

        Password password ->
            { model | password = password }

        RePassword rePassword ->
            { model | rePassword = rePassword }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Contact Us" ]
        , viewInput "text" "Name" model.name Name
        , viewInput "text" "Email" model.email Email
        , viewInput "password" "Password" model.password Password
        , viewInput "password" "Re-enter Password" model.rePassword RePassword
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []

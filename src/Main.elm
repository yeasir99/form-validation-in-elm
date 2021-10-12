module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MODEL


type alias Model =
    { name : String
    , email : String
    , password : String
    , rePassword : String
    }


model : Model
model =
    Model "" "" "" ""



-- UPDATE


type Msg
    = Name String
    | Email String
    | Password String
    | RePassword String


update : Msg -> Model -> Model
update msg store =
    case msg of
        Name name ->
            { store | name = name }

        Email email ->
            { store | email = email }

        Password password ->
            { store | password = password }

        RePassword rePassword ->
            { store | rePassword = rePassword }


view : Model -> Html Msg
view store =
    div []
        [ h2 [] [ text "Contact Us" ]
        , viewInput "text" "Name" store.name Name
        , viewInput "text" "Email" store.email Email
        , viewInput "password" "Password" store.password Password
        , viewInput "password" "Re-enter Password" store.rePassword RePassword
        ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
    input [ type_ t, placeholder p, value v, onInput toMsg ] []


main =
    Browser.sandbox { init = model, update = update, view = view }

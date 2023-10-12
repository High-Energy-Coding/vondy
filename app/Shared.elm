module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import BackendTask exposing (BackendTask)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import UrlPath exposing (UrlPath)
import View exposing (View)


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Nothing
    }


type Msg
    = SharedMsg SharedMsg
    | MenuClicked


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMenu : Bool
    }


init :
    Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : UrlPath
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Effect Msg )
init flags maybePagePath =
    ( { showMenu = False }
    , Effect.none
    )


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        SharedMsg globalMsg ->
            ( model, Effect.none )

        MenuClicked ->
            ( { model | showMenu = not model.showMenu }, Effect.none )


subscriptions : UrlPath -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : BackendTask FatalError Data
data =
    BackendTask.succeed ()


view :
    Data
    ->
        { path : UrlPath
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : List (Html msg), title : String }
view sharedData page model toMsg pageView =
    { body =
        [ Html.nav [] [ navView model ] |> Html.map toMsg
        , Html.main_ [] pageView.body
        , div [ class "footer-row " ] [ footerView ]
        ]
    , title = pageView.title
    }


navView model =
    div [ class "nav-container" ]
        ([ div [ class "topbar" ]
            [ Route.Index |> Route.link [] [ img [ class "logo", src "/logo.png" ] [] ]
            , div [ class "clickies" ]
                [ div [ class "clickie" ] [ Route.Index |> Route.link [] [ text "Main" ] ]
                , div [ class "clickie" ] [ Route.AboutUs |> Route.link [] [ text "About Us" ] ]
                , div [ class "clickie" ] [ Route.Services |> Route.link [] [ text "Services" ] ]
                , div [ class "clickie" ] [ Route.ContactUs |> Route.link [] [ text "Contact Us" ] ]
                ]
            , hamburgerOrX model
            ]
         ]
            ++ navItemsView model
        )


hamburgerOrX model =
    case model.showMenu of
        False ->
            button [ onClick MenuClicked, class "icon" ] [ i [ class "fa fa-bars" ] [] ]

        True ->
            button [ onClick MenuClicked, class "icon" ] [ i [ class "fa fa-close" ] [] ]


navItemsView model =
    case model.showMenu of
        False ->
            []

        True ->
            [ div [ class "item" ] [ Route.Index |> Route.link [] [ text "Main" ] ]
            , div [ class "item" ] [ Route.AboutUs |> Route.link [] [ text "About Us" ] ]
            , div [ class "item" ] [ Route.Services |> Route.link [] [ text "Services" ] ]
            , div [ class "item" ] [ Route.ContactUs |> Route.link [] [ text "Contact Us" ] ]
            ]


footerView =
    footer
        [ class "footer" ]
        [ div
            [ class "contact-us" ]
            [ h4 [] [ text "Contact Us" ]
            , p [] [ text "123 Consulting Lane" ]
            , p [] [ text "New York, NY 10001" ]
            , p [] [ text "555-555-5555" ]
            , p [] [ text "contact@consultingfirm.com" ]
            ]
        , div
            [ class "social-media" ]
            [ h4 [] [ text "Social Media" ]
            , div [ class "icons" ]
                [ i [ class "fa fa-twitter" ] []
                , i [ class "fa fa-linkedin" ] []
                , i [ class "fa fa-facebook" ] []
                ]
            ]
        ]

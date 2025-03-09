module Route.Accreditations exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Copy
import Effect
import FatalError exposing (FatalError)
import Head
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import PagesMsg
import RouteBuilder
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


route : RouteBuilder.StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single { data = data, head = head }
        |> RouteBuilder.buildNoState
            { view = view
            }


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( {}, Effect.none )


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    ( model, Effect.none )


type alias Data =
    { message : String }


type alias ActionData =
    {}


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data
        |> BackendTask.andMap
            (BackendTask.succeed "Hello!")


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Vondy Solutions | Accreditations", body = [ aboutUsView ] }


aboutUsView =
    div [ class "about-us-container" ]
        [ div [ class "title-row" ] [ h1 [] [ text "Accreditations and Collaboration" ] ]
        , div [ class "blurb-row" ]
            [ div [ class "blurb" ] [ p [] [ text Copy.accBlurb ] ]
            ]
        , div [ class "logo-row" ] logoRowView
        , div [ class "blurb-row" ]
            [ div [ class "blurb" ]
                [ p [] [ text Copy.accBlurb2 ]
                , p [] [ text Copy.accBlurb3 ]
                ]
            ]
        , div [ class "cert-row" ]
            [ certRowView
            ]
        ]


certRowView =
    div [ class "cert-row-flex" ]
        [ div [ class "cert" ]
            [ img [ src "/cert_rh.png" ] []
            , p [] [ text "We educate you on leveraging automation to enhance efficiency, reduce errors, and streamline your business operations." ]
            ]
        , div [ class "cert" ]
            [ img [ src "/cert_casp.png" ] []
            , p [] [ text "We educate you on optimizing cloud solutions for scalability, security, and cost-efficiency, helping you make informed decisions." ]
            ]
        , div [ class "cert" ]
            [ img [ src "/cert_aws.png" ] []
            , p [] [ text "We guide you through the best security practices to protect your data and systems, ensuring your business stays safe and compliant." ]
            ]
        ]


logoRowView =
    [ div [ class "public" ]
        [ div [] [ h2 [] [ text "Public" ] ]
        , div [ class "slot top" ]
            [ img [ src "/cisa.png" ] []
            , img [ src "/mepcom.png" ] []
            ]
        , div [ class "slot bottom" ]
            [ img [ src "/socom.png" ] []
            , img [ src "/dfas.png" ] []
            ]
        ]
    , div [ class "private" ]
        [ div [] [ h2 [] [ text "Private" ] ]
        , div [ class "slot top" ]
            [ img [ src "/cars.png" ] []
            , img [ src "/reyrey.png" ] []
            ]
        , div [ class "slot bottom" ]
            [ img [ src "/leo_burnett.png" ] []
            ]
        ]
    ]

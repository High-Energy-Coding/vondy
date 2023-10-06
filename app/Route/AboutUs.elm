module Route.AboutUs exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Copy
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import PagesMsg
import RouteBuilder
import Server.Request
import Server.Response
import Shared
import UrlPath
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
    { title = "AboutUs", body = [ aboutUsView ] }


aboutUsView =
    div [ class "about-us-container" ]
        [ div [ class "office" ] [ img [ src "/office2.jpg" ] [] ]
        , div [ class "about-us" ]
            [ h1 [] [ text "About Us" ]
            , p [ class "copy" ] [ Copy.aboutUs ]
            , h2 [] [ text "Leadership" ]
            , div [ class "leaders" ] <| List.map viewLeader leaders
            ]
        , div [ class "kickass-row " ] [ kickAbout ]
        ]


kickAbout =
    div [ class "kickabout" ]
        [ img [ class "america", src "america.jpg" ] []
        , div [ class "line-container" ]
            [ h1 [ class "line" ] [ Copy.aboutUsBottom ]
            ]
        ]


viewLeader leader =
    div [ class "leader" ]
        [ img [ src leader.image ] []
        , h2 [] [ text leader.name ]
        , p [] [ text leader.title ]
        , p [] [ text leader.bio ]
        ]


type alias Leader =
    { name : String
    , title : String
    , bio : String
    , image : String
    }


leaders : List Leader
leaders =
    [ { name = "Rebecca VonMoser"
      , title = "COO"
      , bio = "A mother of boys turned IT consulting leader, Rebecca is known for her exceptional organizational skills and meticulous attention to detail."
      , image = "https://example.com/john-doe.jpg"
      }
    , { name = "Brittany VonMoser"
      , title = "CTO"
      , bio = "Brittany's unique background allows her to bridge the gap between healthcare providers and technology experts, resulting in innovative solutions that improve patient care."
      , image = "https://example.com/jane-smith.jpg"
      }
    , { name = "Daniel VonMoser"
      , title = "CIO"
      , bio = "Air Force Reserve veteran and IT consultant with extensive experience in server management, automation, cloud solutions, and security."
      , image = "https://example.com/bob-johnson.jpg"
      }
    ]


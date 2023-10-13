module Route.Services exposing (Model, Msg, RouteParams, route, Data, ActionData)

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


type alias Data =
    String


type alias ActionData =
    {}


data : BackendTask FatalError Data
data =
    BackendTask.succeed "hi"


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Vondy Solutions | Services"
    , body =
        [ div [ class "services-container" ]
            [ div [ class "whiteboard" ] [ img [ src "/whiteboard.jpg" ] [] ]
            , div [ class "services" ]
                [ h1 [] [ text "Services" ]
                , p [ class "copy" ] Copy.services
                ]
            ]
        ]
    }

module Route.ContactUs exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
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
    { message : String
    }


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
    { title = "Vondy Solutions | Contact Us", body = [ contactUsView ] }


contactUsView =
    div [ class "contact-container" ]
        [ --  div [ class "whiteboard" ] [ img [ src "/whiteboard.jpg" ] [] ]
          h1 [ class "interested" ] [ text "Interested in connecting with us?" ]
        , div [ class "connect" ]
            [ Html.form []
                [ div [ class "typings" ] [ input [ placeholder "Name" ] [] ]
                , div [ class "typings" ] [ input [ placeholder "E-mail" ] [] ]
                , div [ class "typings" ] [ input [ placeholder "Company" ] [] ]
                , div [ class "typings" ] [ input [ placeholder "Message", class "message" ] [] ]
                , button [] [ text "Send" ]
                ]
            ]
        ]


action :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    BackendTask.succeed (Server.Response.render {})

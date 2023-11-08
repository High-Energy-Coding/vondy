module Route.AboutUs exposing (Model, Msg, RouteParams, route, Data, ActionData)

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
    { title = "Vondy Solutions | About Us", body = [ aboutUsView ] }


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
    [ { name = "Douglas VonMoser"
      , title = "CEO"
      , bio = "Uses words like honor, code, and loyalty as punchlines. Doug is a highly skilled and innovative software developer with a passion for creating cutting-edge technology solutions. With a strong foundation in computer science and a keen eye for problem-solving, he has consistently demonstrated his ability to turn complex ideas into functional software applications"
      , image = "/doug.jpg"
      }
    , { name = "Joseph VonMoser"
      , title = "President"
      , bio = "Dedicated and disciplined individual with a passion for all things business and finance. Having served in the United States Marine Corps as an EOD technician for a little under a decade, he developed invaluable leadership, teamwork, and problem-solving skills."
      , image = "/doug.jpg"
      }
    , { name = "Daniel VonMoser"
      , title = "CIO"
      , bio = "Air Force Veteran and IT consultant with extensive experience in server management, automation, cloud solutions, and security. Throughout his career, Daniel has adeptly navigated ambiguity, consistently leading teams towards clear and innovative solutions."
      , image = "/doug.jpg"
      }
    ]

module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Copy
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { message : String
    }


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data
        |> BackendTask.andMap
            (BackendTask.succeed "Hello!")


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "elm-pages is running"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "elm-pages is running"
    , body = homeView
    }


homeView =
    [ div [ class "content" ]
        [ div [ class "hero-container" ] hero2
        , div [ class "row " ] [ whatWeDoView ]
        , div [ class "expertise-row" ] [ expertise ]
        , div [ class "kickass-row " ] [ kickass ]
        , div [ class "logo-row " ] [ logoRow ]
        ]
    ]


hero2 =
    [ img [ class "hero", src "/city1.jpg" ] []
    , h1 [ class "headline" ] [ text "Innovate", br [] [], text "with", br [] [], text "confidence" ]
    ]


whatWeDoView =
    div [ class "wwd-container" ]
        [ div [ class "draw" ] [ img [ src "logo.png", class "draw-logo" ] [] ]
        , div [ class "why" ]
            [ h1 [] [ text "Why Vondy Solutions?" ]
            , p [] [ text Copy.whatWeDo ]
            ]
        ]


expertise =
    div [ class "expertise" ]
        [ expertiseSquare "automation.svg" "Systems Automation" "Our expertise in Ansible can benefit you by automating repetitive and time-consuming IT tasks, improving consistency and standardization across your IT infrastructure, and accelerating your cloud migration and DevOps initiatives. This can lead to increased efficiency, productivity, reliability, and reduced risk and costs."
        , expertiseSquare "cloud.svg" "Cloud Migration and Management" "We can help safeguard your organization's data and systems from cyber threats and ensure compliance with regulatory standards. Our expertise in security and compliance allows us to design and implement effective strategies tailored to your unique needs, reducing the risk of security incidents and demonstrating compliance to relevant stakeholders."
        , expertiseSquare "security.svg" "Security and Compliance" "Our team of experts can help you develop and execute a customized cloud migration strategy, providing ongoing support and monitoring to ensure optimal performance and cost efficiency, while also offering expertise in cloud management to drive innovation and growth for your business."
        , expertiseSquare "automation.svg" "Software Development" "Our software development services represent a perfect blend of technical excellence, client-focused collaboration, and a relentless pursuit of perfection. When you choose us, you're choosing the best in the business, a partner dedicated to transforming your software dreams into reality and driving your success in the digital world."
        ]


expertiseSquare path title copy =
    div [] [ img [ class "svg", src path ] [], h4 [] [ text title ], p [ class "copy" ] [ text copy ] ]


kickass =
    div [ class "kickass" ]
        [ img [ class "earth", src "earth.jpeg" ] []
        , div [ class "line-container" ]
            [ h1 [ class "line" ] [ text "We deliver cutting-edge technology solutions to organizations that demand the absolute best in performance and reliability." ]
            ]
        ]


logoRow =
    div [ class "logo-dark-container" ]
        [ img [ class "logo-dark", src "logo-dark.jpg" ] []
        ]

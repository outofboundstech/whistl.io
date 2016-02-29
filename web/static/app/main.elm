import Html exposing (Attribute, div, label, input, text, p)
import Html.Attributes exposing (id, name, class, for, type')
import Html.Events exposing (on, onClick)
import Json.Decode as Json exposing (Decoder, at, string)
import StartApp.Simple as StartApp

import Debug exposing (log)

main = StartApp.start { model = model, view = view, update = update }

model = "Hello, World!"

view address model =
  div [ class "form-group" ]
    [ label [ class "control-label", for "upload_file" ] [ text "Documents" ]
    , input [ type' "file", class "form-control", id "upload_file", name "upload[file]",
        onChange address Encrypt ] [ ]
    , p [ ] [ text model ]
    ]

type Action
  = Noop
  | Encrypt String

update action model =
  case action of
    Noop -> model
    Encrypt filepath -> filepath

-- Custom event handler
targetFile : Json.Decoder String
targetFile = at ["target", "files", "[0]"] string

onChange : Signal.Address a -> (String -> a) -> Attribute
onChange address contentToValue = on "change" targetFile
  (\str -> Signal.message address (contentToValue str))

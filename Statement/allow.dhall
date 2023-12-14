let Prelude = ../deps/Prelude.dhall

let Action = ../Action.dhall

let Effect = ../Effect.dhall

let Resource = ../Resource.dhall

let Schema = ./Schema.dhall

let JSON = Prelude.JSON

let allow
    : List Text → List JSON.Type → Schema.Type
    = λ(actions : List Text) →
      λ(resources : List JSON.Type) →
        Schema::{
        , Effect = Effect.Allow
        , Action = Action.Action actions
        , Resource = Some (Resource.Resource resources)
        }

in  allow

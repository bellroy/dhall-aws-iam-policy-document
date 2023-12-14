let Prelude = ../../../deps/Prelude.dhall

let Action = ../Action.dhall

let Condition = ../Condition/Schema.dhall

let Effect = ../Effect.dhall

let Principal = ../Principal/Type.dhall

let Resource = ../Resource.dhall

let JSON = Prelude.JSON

in  { Type =
        { Sid : Optional JSON.Type
        , Principal : Optional Principal
        , Effect : Effect
        , Action : Action
        , Resource : Optional Resource
        , Condition : Condition.Type
        }
    , default =
      { Sid = None JSON.Type
      , Principal = None Principal
      , Resource = None Resource
      , Condition = Condition::{=}
      }
    }

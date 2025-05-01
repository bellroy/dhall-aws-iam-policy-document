let Prelude =
      ../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Action =
      ../Action.dhall
        sha256:fbbaf446f3b123d85a16c41f64b017271dcc4a1f2055f49f876ff4653099b2f5

let Condition =
      ../Condition/Schema.dhall
        sha256:4497bb132a574a83ab91864490ff7865bfbcd4cfe94fe39c891ffc6e091ff7eb

let Effect =
      ../Effect.dhall
        sha256:8329a0fbcf5673c944a147d5ce1937750ccb8ddfd715e2791edd57729af3ad83

let Principal =
      ../Principal/Type.dhall
        sha256:edeab3a79e1df4274aedbc04e8ca8e51cd3a23d2518449224211686213b14ac1

let Resource =
      ../Resource.dhall
        sha256:814f7d7b765ef36f0f2b713ee4cf140b2c7e3ecf5cabe0b0ad2d3436884dc290

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

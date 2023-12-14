let Prelude =
      ../deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let Action =
      ../Action.dhall
        sha256:fbbaf446f3b123d85a16c41f64b017271dcc4a1f2055f49f876ff4653099b2f5

let Effect =
      ../Effect.dhall
        sha256:8329a0fbcf5673c944a147d5ce1937750ccb8ddfd715e2791edd57729af3ad83

let Resource =
      ../Resource.dhall
        sha256:814f7d7b765ef36f0f2b713ee4cf140b2c7e3ecf5cabe0b0ad2d3436884dc290

let Schema =
      ./Schema.dhall
        sha256:b82c0b7001b93c6563bd4f95b523c52c2c546d8f3e2c88b007e09a6f53ff56da

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

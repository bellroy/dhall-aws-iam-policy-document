let Prelude = ../../../../deps/Prelude.dhall

let JSON = Prelude.JSON

in  { Type =
        { AWS : List JSON.Type
        , Federated : List JSON.Type
        , Service : List JSON.Type
        , CanonicalUser : List JSON.Type
        }
    , default =
      { AWS = Prelude.List.empty JSON.Type
      , Federated = Prelude.List.empty JSON.Type
      , Service = Prelude.List.empty JSON.Type
      , CanonicalUser = Prelude.List.empty JSON.Type
      }
    }

let Prelude =
      ../../../deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

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

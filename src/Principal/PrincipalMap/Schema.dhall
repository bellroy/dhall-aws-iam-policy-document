let Prelude =
      ../../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

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

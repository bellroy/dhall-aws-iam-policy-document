{-|
Condition values for each condition key.
-}
let Prelude =
      ../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let JSON = Prelude.JSON

in  Prelude.Map.Type Text (List JSON.Type)

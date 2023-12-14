{-|
Condition values for each condition key.
-}
let Prelude =
      ../deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let JSON = Prelude.JSON

in  Prelude.Map.Type Text (List JSON.Type)

{-|
Condition values for each condition key.
-}
let Prelude = ../deps/Prelude.dhall

let JSON = Prelude.JSON

in  Prelude.Map.Type Text (List JSON.Type)

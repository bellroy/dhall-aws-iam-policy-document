let Prelude = ../deps/Prelude.dhall

let Principal = ./Type.dhall

let PrincipalMap = ./PrincipalMap/package.dhall

let JSON = Prelude.JSON

let Map = Prelude.Map

let toEntry
    : Principal → Map.Entry Text (Optional JSON.Type)
    = let kv = Map.keyValue (Optional JSON.Type)

      in  λ(p : Principal) →
            merge
              { All = kv "Principal" (Some (JSON.string "*"))
              , Principal =
                  λ(p : PrincipalMap.Schema.Type) →
                    kv "Principal" (Some (PrincipalMap.toJSON p))
              , NotPrincipal =
                  λ(p : PrincipalMap.Schema.Type) →
                    kv "NotPrincipal" (Some (PrincipalMap.toJSON p))
              }
              p

in  toEntry

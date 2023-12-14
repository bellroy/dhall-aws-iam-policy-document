let Prelude =
      ../deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let Principal =
      ./Type.dhall
        sha256:edeab3a79e1df4274aedbc04e8ca8e51cd3a23d2518449224211686213b14ac1

let PrincipalMap =
      ./PrincipalMap/package.dhall
        sha256:d918d3bce0458fd1aa434244a0f4db8de20a1ecfc1a09e16e503d63dda697ad0

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

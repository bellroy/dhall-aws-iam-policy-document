let Prelude =
      ../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

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

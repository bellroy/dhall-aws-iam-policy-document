let Prelude =
      ../../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Map/mapMaybe = Prelude.Map.mapMaybe

let Schema =
      ./Schema.dhall
        sha256:5594336c5d9ca22a1d98e818b156cdb88ed3f8765434e1cc065b44795353a86f

let JSON = Prelude.JSON

let toJSON
    : Schema.Type → JSON.Type
    = λ(p : Schema.Type) →
        JSON.object
          ( Map/mapMaybe
              Text
              (List JSON.Type)
              JSON.Type
              ( λ(js : List JSON.Type) →
                  if    Prelude.List.null JSON.Type js
                  then  None JSON.Type
                  else  Some (JSON.array js)
              )
              (toMap p)
          )

in  toJSON

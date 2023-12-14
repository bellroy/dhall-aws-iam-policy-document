let Prelude = ../../../../deps/Prelude.dhall

let Map/mapMaybe = ../../../../Map/mapMaybe.dhall

let Schema = ./Schema.dhall

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

let Prelude = ../../deps/Prelude.dhall

let Schema = ./Schema.dhall

let Statement = ./Statement/package.dhall

let JSON = Prelude.JSON

let Map = Prelude.Map

let Optional/map = Prelude.Optional.map

let toJSON
    : Schema.Type → JSON.Type
    = λ(p : Schema.Type) →
        JSON.object
          ( Map.unpackOptionals
              Text
              JSON.Type
              ( let kv = Map.keyValue (Optional JSON.Type)

                in  [ kv "Version" (Some (JSON.string "2012-10-17"))
                    , kv "Id" (Optional/map Text JSON.Type JSON.string p.Id)
                    , kv
                        "Statement"
                        ( Some
                            ( JSON.array
                                ( Prelude.List.map
                                    Statement.Schema.Type
                                    JSON.Type
                                    Statement.toJSON
                                    p.Statement
                                )
                            )
                        )
                    ]
              )
          )

in  toJSON

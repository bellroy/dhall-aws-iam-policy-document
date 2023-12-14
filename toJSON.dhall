let Prelude =
      ./deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let Schema =
      ./Schema.dhall
        sha256:e40d15dee4e5a7dbc8244a53ca7e7f4322be4de3a1094fd4ea8a87129cd24b35

let Statement =
      ./Statement/package.dhall
        sha256:b28a641fd18d4d6575b0bd467e2a2b42861881fd0febbf10d73954635394b3d0

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

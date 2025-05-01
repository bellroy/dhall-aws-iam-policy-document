let Prelude =
      ../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Principal =
      ../Principal/package.dhall
        sha256:20741303b4f8931ce98c6b8320ea86547e6ef127a0e4c6efb1b1da253106a024

let Condition =
      ../Condition/package.dhall
        sha256:e1b9c216875b17595a88352a10602656c69888b55997f492a403d01d5e5417da

let Resource =
      ../Resource.dhall
        sha256:814f7d7b765ef36f0f2b713ee4cf140b2c7e3ecf5cabe0b0ad2d3436884dc290

let Schema =
      ./Schema.dhall
        sha256:b82c0b7001b93c6563bd4f95b523c52c2c546d8f3e2c88b007e09a6f53ff56da

let JSON = Prelude.JSON

let Map = Prelude.Map

let List/map = Prelude.List.map

let JSON/textArray
    : List Text → JSON.Type
    = λ(ts : List Text) → JSON.array (List/map Text JSON.Type JSON.string ts)

let toJSON
    : Schema.Type → JSON.Type
    = λ(s : Schema.Type) →
        JSON.object
          ( Map.unpackOptionals
              Text
              JSON.Type
              ( let kv = Map.keyValue (Optional JSON.Type)

                in    [ kv "Sid" s.Sid
                      , kv
                          "Effect"
                          ( Some
                              ( JSON.string
                                  ( merge
                                      { Allow = "Allow", Deny = "Deny" }
                                      s.Effect
                                  )
                              )
                          )
                      , merge
                          { All = kv "Action" (Some (JSON.string "*"))
                          , Action =
                              λ(a : List Text) →
                                kv "Action" (Some (JSON/textArray a))
                          , NotAction =
                              λ(a : List Text) →
                                kv "NotAction" (Some (JSON/textArray a))
                          }
                          s.Action
                      ]
                    # merge
                        { Some = λ(p : Principal.Type) → [ Principal.toEntry p ]
                        , None = [] : Map.Type Text (Optional JSON.Type)
                        }
                        s.Principal
                    # merge
                        { Some =
                            λ(resource : Resource) →
                              [ merge
                                  { All = kv "Resource" (Some (JSON.string "*"))
                                  , Resource =
                                      λ(r : List JSON.Type) →
                                        kv "Resource" (Some (JSON.array r))
                                  , NotResource =
                                      λ(r : List JSON.Type) →
                                        kv "NotResource" (Some (JSON.array r))
                                  }
                                  resource
                              ]
                        , None = [] : Map.Type Text (Optional JSON.Type)
                        }
                        s.Resource
                    # ( if    Condition.isEmpty s.Condition
                        then  [] : Map.Type Text (Optional JSON.Type)
                        else  [ kv
                                  "Condition"
                                  (Some (Condition.toJSON s.Condition))
                              ]
                      )
              )
          )

in  toJSON

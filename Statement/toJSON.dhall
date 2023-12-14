let Prelude = ../deps/Prelude.dhall

let Principal = ../Principal/package.dhall

let Condition = ../Condition/package.dhall

let Resource = ../Resource.dhall

let Schema = ./Schema.dhall

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

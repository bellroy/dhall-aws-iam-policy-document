let Prelude = ../../../deps/Prelude.dhall

let Map/mapMaybe = ../../../Map/mapMaybe.dhall

let Condition = ./Schema.dhall

let ConditionArgs = ./ConditionArgs.dhall

let JSON = Prelude.JSON

let Map = Prelude.Map

let ConditionArgs/toJSON
    : ConditionArgs → JSON.Type
    = λ(args : ConditionArgs) →
        JSON.object (Map.map Text (List JSON.Type) JSON.Type JSON.array args)

let ConditionArgs/isEmpty
    : ConditionArgs → Bool
    = λ(a : ConditionArgs) →
        Prelude.List.null (Map.Entry Text (List JSON.Type)) a

let toJSON
    : Condition.Type → JSON.Type
    = λ(c : Condition.Type) →
        JSON.object
          ( Map/mapMaybe
              Text
              ConditionArgs
              JSON.Type
              ( λ(ca : ConditionArgs) →
                  if    ConditionArgs/isEmpty ca
                  then  None JSON.Type
                  else  Some (ConditionArgs/toJSON ca)
              )
              (toMap c)
          )

in  toJSON

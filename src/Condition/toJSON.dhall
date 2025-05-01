let Prelude =
      ../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let Map/mapMaybe = Prelude.Map.mapMaybe

let Condition =
      ./Schema.dhall
        sha256:4497bb132a574a83ab91864490ff7865bfbcd4cfe94fe39c891ffc6e091ff7eb

let ConditionArgs =
      ./ConditionArgs.dhall
        sha256:d88cf89660400ae41df90770ba4a1f3e4ab460e98c6849456711a756f411bb1c

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

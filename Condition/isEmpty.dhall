let Prelude = ../deps/Prelude.dhall

let Condition = ./Schema.dhall

let ConditionArgs = ./ConditionArgs.dhall

let JSON = Prelude.JSON

let ConditionExpr = Prelude.Map.Entry Text ConditionArgs

let isEmpty
    : Condition.Type → Bool
    = λ(c : Condition.Type) →
        Prelude.List.all
          ConditionExpr
          ( λ(ce : ConditionExpr) →
              Prelude.List.null
                (Prelude.Map.Entry Text (List JSON.Type))
                ce.mapValue
          )
          (toMap c)

let example0 = assert : isEmpty Condition::{=} ≡ True

let example1 =
        assert
      :   isEmpty
            Condition::{
            , IpAddress = toMap
                { `aws:SourceIp` = [ JSON.string "203.0.113.0/24" ] }
            }
        ≡ False

in  isEmpty

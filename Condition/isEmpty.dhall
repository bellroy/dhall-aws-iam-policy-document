let Prelude =
      ../deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let Condition =
      ./Schema.dhall
        sha256:4497bb132a574a83ab91864490ff7865bfbcd4cfe94fe39c891ffc6e091ff7eb

let ConditionArgs =
      ./ConditionArgs.dhall
        sha256:d88cf89660400ae41df90770ba4a1f3e4ab460e98c6849456711a756f411bb1c

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

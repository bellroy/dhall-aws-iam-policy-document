{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_notprincipal.html

`All` := `Principal: *`
-}
let PrincipalMap = ./PrincipalMap/package.dhall

in  < All
    | Principal : PrincipalMap.Schema.Type
    | NotPrincipal : PrincipalMap.Schema.Type
    >

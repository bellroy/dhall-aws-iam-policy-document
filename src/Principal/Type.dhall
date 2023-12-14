{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_notprincipal.html

`All` := `Principal: *`
-}
let PrincipalMap =
      ./PrincipalMap/package.dhall
        sha256:d918d3bce0458fd1aa434244a0f4db8de20a1ecfc1a09e16e503d63dda697ad0

in  < All
    | Principal : PrincipalMap.Schema.Type
    | NotPrincipal : PrincipalMap.Schema.Type
    >

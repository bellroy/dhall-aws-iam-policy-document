{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_resource.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_notresource.html

`All` := `Resource: *`
-}
let Prelude = ../../deps/Prelude.dhall

let JSON = Prelude.JSON

in  < All | Resource : List JSON.Type | NotResource : List JSON.Type >

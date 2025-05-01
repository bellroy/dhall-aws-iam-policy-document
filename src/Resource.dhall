{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_resource.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_notresource.html

`All` := `Resource: *`
-}
let Prelude =
      ../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

let JSON = Prelude.JSON

in  < All | Resource : List JSON.Type | NotResource : List JSON.Type >

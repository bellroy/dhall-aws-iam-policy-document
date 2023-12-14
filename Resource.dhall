{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_resource.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_notresource.html

`All` := `Resource: *`
-}
let Prelude =
      ./deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let JSON = Prelude.JSON

in  < All | Resource : List JSON.Type | NotResource : List JSON.Type >

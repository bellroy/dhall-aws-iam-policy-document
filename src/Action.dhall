{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_action.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_notaction.html

`All` := `Action: *`
-}
< All | Action : List Text | NotAction : List Text >

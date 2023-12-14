{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html

This package tries to enforce the documented
[policy grammar](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_grammar.html).

`Schema` represents a policy document.

This package uses `Type.dhall` to define data types and `Schema.dhall` to
define record schemas (for use with `::`).
-}
{ Action = ./Action.dhall
, Condition = ./Condition/package.dhall
, Effect = ./Effect.dhall
, Principal = ./Principal/package.dhall
, Resource = ./Resource.dhall
, Schema = ./Schema.dhall
, Statement = ./Statement/package.dhall
, toJSON = ./toJSON.dhall
}

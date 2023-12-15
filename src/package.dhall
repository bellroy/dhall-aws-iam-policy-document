{-|
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies.html

This package tries to enforce the documented
[policy grammar](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_grammar.html).

`Schema` represents a policy document.

This package uses `Type.dhall` to define data types and `Schema.dhall` to
define record schemas (for use with `::`).
-}
{ Action =
    ./Action.dhall
      sha256:fbbaf446f3b123d85a16c41f64b017271dcc4a1f2055f49f876ff4653099b2f5
, Condition =
    ./Condition/package.dhall
      sha256:e1b9c216875b17595a88352a10602656c69888b55997f492a403d01d5e5417da
, Effect =
    ./Effect.dhall
      sha256:8329a0fbcf5673c944a147d5ce1937750ccb8ddfd715e2791edd57729af3ad83
, Principal =
    ./Principal/package.dhall
      sha256:20741303b4f8931ce98c6b8320ea86547e6ef127a0e4c6efb1b1da253106a024
, Resource =
    ./Resource.dhall
      sha256:814f7d7b765ef36f0f2b713ee4cf140b2c7e3ecf5cabe0b0ad2d3436884dc290
, Schema =
    ./Schema.dhall
      sha256:e40d15dee4e5a7dbc8244a53ca7e7f4322be4de3a1094fd4ea8a87129cd24b35
, Statement =
    ./Statement/package.dhall
      sha256:b28a641fd18d4d6575b0bd467e2a2b42861881fd0febbf10d73954635394b3d0
, toJSON =
    ./toJSON.dhall
      sha256:c47c0b1c0f9ea875da8ab0055b0e66e9eb0b0bae4f5beb5c698a397aca455792
}

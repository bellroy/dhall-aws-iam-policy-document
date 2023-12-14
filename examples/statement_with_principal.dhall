-- The "Require SSE-KMS for all objects written to a bucket" policy example from
-- https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html#example-bucket-policies-encryption-1
let Prelude = ../deps/Prelude.dhall

let JSON = Prelude.JSON

let Policy = ../src/package.dhall

let Action = Policy.Action

let Condition = Policy.Condition

let Effect = Policy.Effect

let Principal = Policy.Principal

let Resource = Policy.Resource

let Statement = Policy.Statement

in  Policy.toJSON
      Policy.Schema::{
      , Id = Some "PutObjectPolicy"
      , Statement =
        [ Statement.Schema::{
          , Sid = Some (JSON.string "DenyObjectsThatAreNotSSEKMS")
          , Effect = Effect.Deny
          , Action = Action.Action [ "s3:PutObject" ]
          , Resource = Some
              ( Resource.Resource
                  [ JSON.string "arn:aws:s3:::DOC-EXAMPLE-BUCKET/*" ]
              )
          , Principal = Some Principal.Type.All
          , Condition = Condition.Schema::{
            , Null = toMap
                { `s3:x-amz-server-side-encryption-aws-kms-key-id` =
                  [ JSON.string "true" ]
                }
            }
          }
        ]
      }

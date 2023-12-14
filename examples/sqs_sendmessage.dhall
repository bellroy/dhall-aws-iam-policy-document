-- Simple example: uses the `allow` convenience function when
-- constructing simple statements
let Prelude = ../deps/Prelude.dhall

let JSON = Prelude.JSON

let Policy = ../src/package.dhall

let Statement = Policy.Statement

in  Policy.toJSON
      Policy.Schema::{
      , Statement =
        [ Statement.allow
            [ "sqs:SendMessage" ]
            [ JSON.string "arn:aws:sqs:us-east-1:123456789012:AQueue" ]
        ]
      }

# dhall-aws-iam-policy-document

Convenience library for writing [IAM Policy
Documents](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html#policies-introduction)
in [Dhall](https://dhall-lang.org/). This is especially useful with
[`dhall-aws-cloudformation`](https://github.com/jcouyang/dhall-aws-cloudformation/),
as writing IAM Policy Documents using Dhall's native JSON type is
unpleasant.

AWS can be pretty finnicky about whether fields are required or
optional. Example: some services need statement IDs in resource
policies, but most of the time they're optional. This library's
objective is therefore *not* to create a perfect,
correct-by-construction type for each place policy documents are used.
Instead, we provide a single broad type which should allow you to
generate whatever policy JSON you might need.

## Sample Usage

```dhall
let Prelude = https://raw.githubusercontent.com/dhall-lang/dhall-lang/v23.0.0/Prelude/package.dhall

let JSON = Prelude.JSON

let Policy = https://raw.githubusercontent.com/bellroy/dhall-aws-iam-policy-document/<ref>/package.dhall

let Statement = Policy.Statement

in  Policy.toJSON
      Policy.Schema::{
      , Statement =
        [ Statement.allow
            [ "sqs:SendMessage" ]
            -- If using dhall-aws-cloudformation, this could be something like
            -- `Fn.render (SQS/Queue.GetAttr.Arn "QueueLogicalName")`
            -- to capture the ARN of a resource by its logical name.
            [ JSON.string "arn:aws:sqs:us-east-1:123456789012:AQueue" ]
        ]
      }
```

## Examples

More examples, and their JSON output, are available in the `examples/`
directory.

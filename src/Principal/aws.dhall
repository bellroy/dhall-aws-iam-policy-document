let Prelude =
      ../../deps/Prelude.dhall
        sha256:397ef8d5cf55e576eab4359898f61a4e50058982aaace86268c62418d3027871

let Principal =
      ./Type.dhall
        sha256:edeab3a79e1df4274aedbc04e8ca8e51cd3a23d2518449224211686213b14ac1

let PrincipalMap =
      ./PrincipalMap/Schema.dhall
        sha256:5594336c5d9ca22a1d98e818b156cdb88ed3f8765434e1cc065b44795353a86f

let JSON = Prelude.JSON

let aws
    : Text → Principal
    = λ(accountId : Text) →
        Principal.Principal PrincipalMap::{ AWS = [ JSON.string accountId ] }

in  aws

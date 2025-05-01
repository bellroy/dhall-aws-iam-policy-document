let Prelude =
      ../../deps/Prelude.dhall
        sha256:931cbfae9d746c4611b07633ab1e547637ab4ba138b16bf65ef1b9ad66a60b7f

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

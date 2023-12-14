let Prelude = ../deps/Prelude.dhall

let Principal = ./Type.dhall

let PrincipalMap = ./PrincipalMap/Schema.dhall

let JSON = Prelude.JSON

let aws
    : Text → Principal
    = λ(accountId : Text) →
        Principal.Principal PrincipalMap::{ AWS = [ JSON.string accountId ] }

in  aws

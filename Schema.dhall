let Statement = ./Statement/Schema.dhall

in  { Type = { Id : Optional Text, Statement : List Statement.Type }
    , default.Id = None Text
    }

let Statement =
      ./Statement/Schema.dhall
        sha256:b82c0b7001b93c6563bd4f95b523c52c2c546d8f3e2c88b007e09a6f53ff56da

in  { Type = { Id : Optional Text, Statement : List Statement.Type }
    , default.Id = None Text
    }

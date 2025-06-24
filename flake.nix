{
  description = "Dhall library for writing AWS IAM Policy Documents";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = inputs:
    let
      devShells = inputs.flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import inputs.nixpkgs { inherit system; };
          pre-commit = inputs.pre-commit-hooks.lib.${system}.run {
            src = inputs.self;
            hooks.nixpkgs-fmt.enable = true;
          };
        in
        {
          devShells.default = pkgs.mkShell {
            inherit (pre-commit) shellHook;

            name = "dhall-aws-iam-policy-document";
            buildInputs = with pkgs; [
              gnumake
              haskellPackages.dhall
              haskellPackages.dhall-json
              haskellPackages.dhall-lsp-server
            ];
          };
        });
    in
    devShells;
}

{
  description = "First Project";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-22.05";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit (pkgs) lib stdenv mkShell callPackage;

        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        # nix develop
        devShell = mkShell {
          name = "first-project-shell";

          buildInputs = with pkgs; [
            # Node
            nodejs-18_x
            nodePackages.pnpm

            # Postgres
            postgresql
          ];
        };
      });
}

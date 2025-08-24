{
  description = "vyv-store dev environment + Docker image build with Nix Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.python312
            pkgs.python312Packages.virtualenv
            (pkgs.poetry.override { python3 = pkgs.python312; })
          ];

          shellHook = ''
            echo "vyv-store dev environment ready!"

            if [ ! -d ".venv" ]; then
            echo "Installing Python dependencies with Poetry..."
            poetry install
            fi

            echo "Run 'poetry run python manage.py runserver' for development"
          '';
        };

        packages.dockerImage = pkgs.dockerTools.buildImage {
          name = "vyv-store";
          tag = "latest";
          copyToRoot = pkgs.buildEnv {
            name = "vyv-store-env";
            paths = [
              pkgs.python312
              pkgs.python312Packages.virtualenv
              pkgs.git
              pkgs.poetry
              ./.   
            ];
          };

          config = {
            WorkingDir = "/app";
            Cmd = [ "poetry" "run" "python" "manage.py" "runserver" "0.0.0.0:8000" ];
            Expose = [ 8000 ];
          };
        };
      }
    );
}


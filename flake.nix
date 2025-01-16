{
  description = "Noels NixOS Flake Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cppyy = {
      url = "github:m-bdf/cppyy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      cppyy,
      ...
    }@inputs:

    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      pythonEnv = pkgs.python3.withPackages (
        ps: with ps; [
          pandas
          matplotlib
          networkx
          numpy
          tqdm
        ]
      );

      devShell = pkgs.mkShell {
        name = "dev-environment";

        packages = with pkgs; [
          cmake
          sqlite
          eigen
          pythonEnv
          cppyy.packages.${system}.cppyy
          bashInteractive
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.sqlite
          pkgs.eigen
          pkgs.stdenv.cc.cc.lib
        ];

        PYTHONPATH = "/ns-3-dev/build/bindings/python";
        PATH = "/ns-3-dev/build/lib";
      };
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/default/configuration.nix
          ];
        };

        workstation = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/workstation/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "noel@nixos" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/default/home.nix
          ];
        };
      };

      devShells.${system}.default = devShell;
    };
}

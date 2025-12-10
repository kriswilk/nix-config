{
  description = "NixOS Host & User Configuration";
  
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      # FIXME: Temporary solution for neovim lsp warning.
      #        Remove "?ref=v0.8" once merged into main branch!
      url = "github:notashelf/nvf?ref=v0.8";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, lib, ... }@inputs:
  let
    hostDir = ./host;
    userDir = ./user;
    hostList = ["vm" "desktop"];

    pkgs = import nixpkgs { 
      system = "x86_64-linux"; 
      # This is a bit of notation that is a little confusing at first. `final` refers 
      # to the "output" package set, or what the pkg set will look like after the overlay
      # is applied. 
      # "Prev" is the packageset before the current overlay; this is helpful because we don't
      # have to worry about "retouching" the overlay. For example, if we set `final.a` in the
      # overlay and also use it, it will infinitely evaluate the overlay.
      overlays = [(final: prev: {
        # you create some new package in the overlay,
        # or modify an old one.
        pythonWithPandas = prev.python311.withPackages(pythonPackages: [ 
            pythonPackages.pandas 
        ]);

        blesh-nightly = prev.blesh.overrideAttrs {
          version = "nightly-20251019+2f564e6";
          src = lib.fetchzip {
            url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly-20251019+2f564e6.tar.xz";
            sha256 = "sha256-fpNorzJcKs1vVhaYKgRz5vcs6jsEvdxe3N4F2L81Rc0=";
          };
        };

      })];
    };

  in {
    # this has pandas! It didn't even exist before our overlay.
        packages."x86_64-linux".pythonWithPandas = pkgs.pythonWithPandas;
        packages."x86_64-linux".blesh-nightly = pkgs.blesh-nightly;


    nixosConfigurations = nixpkgs.lib.genAttrs hostList (hostName: nixpkgs.lib.nixosSystem {
      modules = [
        "${hostDir}/${hostName}"
        inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              inputs.nvf.homeManagerModules.default
              inputs.nix-index-database.homeModules.default
            ];
          };
        }
        inputs.stylix.nixosModules.stylix
      ];
      specialArgs = { inherit hostDir hostName userDir; };
    });
  };
}
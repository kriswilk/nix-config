{
  description = "NixOS System & User Configuration";
  
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
  };

  outputs = { self, nixpkgs, disko, home-manager, ... }:
  let
    moduleLib = import ./lib/importers.nix { inherit inputs; };
    nixosConfigs = {
      vm = {};
      desktop = {};
    };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (configName: configData:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (./host + "/${configName}")
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit configName;
          inherit moduleLib;
        };
      }
    ) nixosConfigs;
  };
}
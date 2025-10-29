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

  outputs = { self, nixpkgs, disko, home-manager, ... }@inputs:
  let
    hostDir = ./host;
    homeDir = ./home;
    nixosConfigs = {
      vm = {};
      desktop = {};
    };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (configName: configData:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          (hostDir + "/${configName}")
        ];
        specialArgs = { inherit configName hostDir homeDir; };
      }
    ) nixosConfigs;
  };
}
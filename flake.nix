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
    nixosConfigs = {
      vm = { system = "x86_64-linux"; };
      desktop = { system = "x86_64-linux"; };
    };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (configName: configData:
      nixpkgs.lib.nixosSystem {
        system = configData.system;
        modules = [
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          (./host + "/${configName}")
        ];
        specialArgs = { inherit inputs configName; };
      }
    ) nixosConfigs;
  };
}
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
    hostDir = ./host;
    homeDir = ./home;
    nixosConfigs = {
      vm = { system = "x86_64-linux"; };
      desktop = { system = "x86_64-linux"; };
    };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (configName: configData:
      nixpkgs.lib.nixosSystem {
        system = configData.system;
        modules = [
          (hostDir + configName + ".nix")
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kris = homeDir + "/kris.nix";
            home-manager.users.guest = homeDir + "/guest.nix";
          }
        ];
        specialArgs = {
          inherit configName;
        };
      }
    ) nixosConfigs;
  };
}
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
  };

  outputs = { self, nixpkgs, disko, home-manager, ... }:
  let
  
    # Hosts
    hostDir = ./host;
    hostList = {
      vm = {
        system = "x86_64-linux";
      };
      desktop = {
        system = "x86_64-linux";
      };
    };

    # Users
    userDir = ./user;
    userList = {
      kris = {
        fullName = "Kris Wilk";
        password = "abc123";
        extraGroups = [ "wheel" ];
      };
      guest = {
        fullName = "Guest User";
        password = "guest";
        extraGroups = [ ];
      };
    };

  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (hostName: hostData:
      nixpkgs.lib.nixosSystem {
        system = hostData.system;
        modules = [
          "${hostDir}/${hostName}.nix"
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit hostDir hostName userDir userList; };
      }
    ) hostList;
  };
}
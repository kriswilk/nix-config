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
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, disko, home-manager, stylix, nvf, ... }:
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
    userGroups = [ "lp" "networkmanager" "scanner" ];
    userList = {
      kris = {
        isNormalUser = true;
        description = "Kris Wilk";
        password = "12345";
        extraGroups = userGroups ++ [ "wheel" ];
      };
      guest = {
        isNormalUser = true;
        description = "Guest User";
        password = "guest";
        extraGroups = userGroups;
      };
    };

  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (hostName: hostAttrs:
      nixpkgs.lib.nixosSystem {
        system = hostAttrs.system;
        modules = [
          "${hostDir}/${hostName}"
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          {
            home-manager.modules = [
              nvf.homeManagerModules.default
            ];
          }
        ];
        specialArgs = { inherit hostDir hostName userDir userList; };
      }
    ) hostList;
  };
}
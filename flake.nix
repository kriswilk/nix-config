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
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, home-manager, nix-index-database, ... }:
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
    nixosConfigurations = nixpkgs.lib.mapAttrs (hostName: hostData:
      nixpkgs.lib.nixosSystem {
        system = hostData.system;
        modules = [
          "${hostDir}/${hostName}.nix"
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          nix-index-database.nixosModules.nix-index
          { programs.nix-index-database.comma.enable = true; }
          <nixpkgs/nixos/modules/services/hardware/sane_extra_backends/brscan4.nix>
        ];
        specialArgs = { inherit hostDir hostName userDir userList; };
      }
    ) hostList;
  };
}
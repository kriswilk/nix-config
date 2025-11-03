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
    hostNames = {
      vm = { system = "x86_64-linux"; };
      desktop = { system = "x86_64-linux"; };
    };
    userNames = {
      kris = {};
      guest = {};
    };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (hostName: hostData:
      nixpkgs.lib.nixosSystem {
        system = hostData.system;
        modules = [
          (hostDir + "/${hostName}.nix")
          { networking.hostName = hostName; }
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = nixpkgs.lib.mapAttrs (userName: userData:
              (homeDir + "/${userName}.nix")
            ) userNames;
          }
        ];
        specialArgs = { inherit hostName; };
      }
    ) hostNames;
  };
}
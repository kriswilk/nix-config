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
    configHosts = {
      vm = { system = "x86_64-linux"; };
      desktop = { system = "x86_64-linux"; };
    };
    configUsers = {
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
          ./host/${hostName}.nix
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit hostName users; };
      }
    ) hostNames;
  };
}
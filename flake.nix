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

  outputs = { self, nixpkgs, disko, home-manager, stylix, nvf, ... }:
  let
    hostList = ["vm" "desktop"];
    hostDir = ./host;
    userDir = ./user;
  in {
    nixosConfigurations = nixpkgs.lib.genAttrs hostList (hostName: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        "${hostDir}/${hostName}"
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              nvf.homeManagerModules.default
            ];
          };
        }
        stylix.nixosModules.stylix
      ];
      specialArgs = { inherit hostDir hostName userDir; };
    });
  };
}
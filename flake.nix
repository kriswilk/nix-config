{
  description = "NixOS Host & User Configuration";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, disko, home-manager, stylix, nvf, ... }:
  let
    hostList = ["vm" "desktop"];
    hostDir = ./host;
    userDir = ./user;
  in {
    nixosConfigurations = nixpkgs.lib.genAttrs hostList (hostName: nixpkgs.lib.nixosSystem {
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
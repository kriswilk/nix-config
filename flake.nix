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
    configNames = [ "vm" "desktop" ];
  in {
    nixosConfigurations = builtins.listToAttrs (builtins.map configName:
      {
        name = configName;
        value = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./host/${configName}.nix
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.kris = ./home/kris.nix;
              home-manager.users.guest = ./home/guest.nix;
            }
          ];
          specialArgs = {
            inherit configName;
          };
        };
      }
     configNames);
  };
}
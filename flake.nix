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
    lib = nixpkgs.lib;

    mkNixosSystem = host:
      lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
          (hostDir + "/${host}")
        ];
        
        # inject variables as special arguments
        specialArgs = { inherit self lib; cfgHost = host; };
      };
  in
  {
    # dynamically create nixosConfigurations
    nixosConfigurations.vm = mkNixosSystem "vm";
    nixosConfigurations.vdesktop = mkNixosSystem "desktop";
  };
}
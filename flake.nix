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

    # find host configurations
    hostsDir = ./hosts;
    hosts = lib.filterAttrs (name: type: type == "directory") (builtins.readDir hostsDir);

    # function that creates a nixosSystem for a given host
    mkNixosSystem = host: type:
      lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # system
          (hostsDir + "/configuration.nix")
          (hostsDir + "/${host}/configuration.nix")
          (hostsDir + "/${host}/hardware-configuration.nix")

          # disko
          disko.nixosModules.disko
          (hostsDir + "/disko-configuration.nix")
          (hostsDir + "/${host}/disko-configuration.nix")

          # home-manager
          home-manager.nixosModules.home-manager
          ./home-manager.nix
        ];
        
        # inject the host name and target disk as special arguments
        specialArgs = { inherit self lib; cfgHost = host; };
      };
  in
  {
    # 5. Dynamically create all nixosConfigurations
    nixosConfigurations = lib.mapAttrs mkNixosSystem hosts;
  };
}
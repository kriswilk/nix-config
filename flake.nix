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

  outputs = { self, lib, nixpkgs, disko, home-manager, ... }:
  let
    #lib = nixpkgs.lib;

    # define users
    users = {
      "kris" = {
        isNormalUser = true;
        description = "Kris Wilk";
        password = "abc123";
        extraGroups = [ "networkmanager" "wheel" ];
      };
      "guest" = {
        isNormalUser = true;
        description = "Guest User";
        password = "guest";
        extraGroups = [ "networkmanager" ];
      };
    };

    # identify host configurations
    hostsDir = ./hosts;
    hosts = lib.filterAttrs (name: type: type == "directory") (builtins.readDir hostsDir);

    mkUserHomeManager = user: userConfig:
    {
      imports = [ ./users/home.nix ./users/${user}/home.nix ];
    };

    # function that creates a nixosSystem for a given host
    mkNixosSystem = host: type:
      lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # system configuration
          (hostsDir + "/configuration.nix")
          (hostsDir + "/${host}/configuration.nix")
          (hostsDir + "/${host}/hardware-configuration.nix")

          # disko
          disko.nixosModules.disko
          (hostsDir + "/disko-configuration.nix")
          (hostsDir + "/${host}/disko-configuration.nix")

          # home-manager
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = lib.mapAttrs mkUserHomeManager users;
          }
        ];
        
        # inject variables as special arguments
        specialArgs = { inherit self lib; cfgHost = host; cfgUsers = users; };
      };
  in
  {
    # dynamically create nixosConfigurations
    nixosConfigurations = lib.mapAttrs mkNixosSystem hosts;
  };
}
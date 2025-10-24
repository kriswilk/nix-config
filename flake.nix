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

    # users
    userDir = ./user;
    userList = {
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
    # helper - create a home-manager config for a given user
    mkHomeManagerUser = user: userConfig:
    {
      imports = [ (userDir + "/home.nix") (userDir + "/${user}/home.nix") ];
    };

    # hosts
    hostDir = ./host;
    hostList = lib.filterAttrs (name: type: type == "directory") (builtins.readDir hostDir);
    # helper - create a nixosSystem for a given host
    mkNixosSystem = host: type:
      lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # system configuration
          (hostDir + "/configuration.nix")
          (hostDir + "/${host}/configuration.nix")
          (hostDir + "/${host}/hardware-configuration.nix")

          # disko
          disko.nixosModules.disko
          (hostDir + "/disko-configuration.nix")
          (hostDir + "/${host}/disko-configuration.nix")

          # home-manager
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = lib.mapAttrs mkHomeManagerUser userList;
          }
        ];
        
        # inject variables as special arguments
        specialArgs = { inherit self lib; cfgHost = host; cfgUsers = userList; };
      };
  in
  {
    # dynamically create nixosConfigurations
    nixosConfigurations = lib.mapAttrs mkNixosSystem hostList;
  };
}
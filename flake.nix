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
    users = lib.filterAttrs (name: type: type == "directory") (builtins.readDir userDir);
    mkHomeManagerUser = user: type:
    {
      imports = [ (userDir + "/home.nix") (userDir + "/${user}/home.nix") ];
    };

    # hosts
    hostDir = ./host;
    hosts = lib.filterAttrs (name: type: type == "directory") (builtins.readDir hostDir);
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
            home-manager.users = lib.mapAttrs mkHomeManagerUser users;
          }
        ] ++ lib.attrValues (lib.mapAttrs (user: type: (userDir + "/${user}/user.nix")) users);;
        
        # inject variables as special arguments
        specialArgs = { inherit self lib; cfgHost = host; cfgUsers = users; };
      };
  in
  {
    # dynamically create nixosConfigurations
    nixosConfigurations = lib.mapAttrs mkNixosSystem hosts;
  };
}
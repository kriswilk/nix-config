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

    # scan for host configurations
    hostsDir = ./hosts;
    hosts = lib.filterAttrs (name: type: type == "directory") (builtins.readDir hostsDir);

    systemUsers = config.users.users;
    usersDir = ./users;

    # function that creates a nixosSystem for a given host
    mkNixosSystem = host: type:
      lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # default configuration
          (hostsDir + "/configuration.nix")
          (hostsDir + "/disko-configuration.nix")
          # host-specific configuration
          (hostsDir + "/${host}/configuration.nix")
          (hostsDir + "/${host}/hardware-configuration.nix")
          (hostsDir + "/${host}/disko-configuration.nix")

          disko.nixosModules.disko

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = lib.mapAttrs mkUserHomeManager systemUsers;
          }
        ];
        
        # inject the host name and target disk as special arguments
        specialArgs = { inherit self lib; cfgHost = host; };
      };
    
    # generate a home-manager configuration for a given user
    mkUserHomeManager = user: userConfig:
    {
      imports = [
        # default configuration
        (usersDir + "/home.nix")
        # user-specific configuration
        (usersDir + "/${user}/home.nix")
      ];
    };

  in
  {
    # 5. Dynamically create all nixosConfigurations
    nixosConfigurations = lib.mapAttrs mkNixosSystem hosts;
  };
}
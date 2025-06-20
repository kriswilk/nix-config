{
  description = "NixOS System & User Configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, disko, ... }: {
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          disko.nixosModules.disko
          ./hosts/vm

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kris = import ./home/kris;
            #home-manager.users.daniela = import ./home/daniela;
            #home-manager.users.hugo = import ./home/hugo;
            #home-manager.users.any = import ./home/any;
            #home-manager.users.les = import ./home/les;
            #home-manager.extraSpecialArgs = {
            #  inherit inputs;
            #  self = inputs.self;
            #};
            #home-manager.sharedModules = [
            #  # ?????
            #];
          }
        ];
      };
    };
  };
}

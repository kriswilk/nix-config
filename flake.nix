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

  outputs = { self, nixpkgs, disko, home-manager, ... }@inputs: {
    nixosConfigs = {
      vm = { modules = [ ./host/vm ]; };
      desktop = { modules = [ ./host/desktop ]; };
    };

    nixosConfigurations = nixpkgs.lib.mapAttrs (configName: configData:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs configName; };
        modules = configData.modules ++ [
          disko.nixosModule.diskoModule
          home-manager.nixosModule.home-manager
          #(./hosts + "/" + configName)
        ];
      }
    ) nixosConfigs;
  };
}
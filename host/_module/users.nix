{ config, lib, pkgs, self, ... }:

{
  users = {
    mutableUsers = false;

    users = {
      kris = {
        isNormalUser = true;
        description = "Kris Wilk";
        password = "abc123";
        extraGroups = [ "networkmanager" "scanner" "lp" "wheel" ];
      };
      guest = {
        isNormalUser = true;
        description = "Guest User";
        password = "guest";
        extraGroups = [ "networkmanager" "scanner" "lp" ];
      };
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      kris = import (self + "/home/kris");
      guest = import (self + "/home/guest");
    };
  };
}
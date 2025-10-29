{ config, lib, pkgs, homeDir, ... }:

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
      kris = import (homeDir + /kris);
      guest = import (homeDir + /guest);
    };
  };
}
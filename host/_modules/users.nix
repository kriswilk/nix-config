{ config, lib, pkgs, ... }:

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
}
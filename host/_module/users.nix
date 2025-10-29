{ config, lib, pkgs, ... }:

{
  users.mutableUsers = false;
  
  users.users.kris = {
    isNormalUser = true;
    description = "Kris Wilk";
    password = "abc123";
    extraGroups = [ "networkmanager" "scanner" "lp" "wheel" ];
  };

  users.users.guest = {
    isNormalUser = true;
    description = "Guest User";
    password = "guest";
    extraGroups = [ "networkmanager" "scanner" "lp" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.kris = import ../../home/kris;
  home-manager.users.guest = import ../../home/guest;
}
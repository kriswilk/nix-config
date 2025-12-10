{ config, lib, pkgs, userDir, ... }:

let
  userGroups = [ "lp" "networkmanager" "scanner" ];
  userList = {
    kris = {
      isNormalUser = true;
      description = "Kris Wilk";
      password = "12345";
      extraGroups = userGroups ++ [ "wheel" ];
      shell = pkgs.fish;
    };
    guest = {
      isNormalUser = true;
      description = "Guest User";
      password = "guest";
      extraGroups = userGroups;
      shell = pkgs.fish;
    };
  };
in {
  users = {
    mutableUsers = false;
    users = userList;
  };

  home-manager = {
    users = lib.mapAttrs (userName: userData:
      "${userDir}/${userName}"
    ) userList;
  };
}
{ config, pkgs, lib, ... }:

let
  systemUsers = { kris={}; guest={};};

  usersDir = "./users";
  
  mkUserHomeManager = user: userConfig:
    {
      imports = [
        (usersDir + "/home.nix")
        (usersDir + "/${user}/home.nix")
      ];
    };

in
{
  # 4. Use mapAttrs to apply the function to every user in the system
  # The result is an attribute set: { kriswilk = { imports = [...]; }; otheruser = { imports = [...]; }; }
  # This matches the structure expected by 'home-manager.users'.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = lib.mapAttrs mkUserHomeManager systemUsers;
  };
}
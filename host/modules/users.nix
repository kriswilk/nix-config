{ config, lib, pkgs, userDir, userList, ... }:

{
  users = {
    mutableUsers = false;

    users = lib.mapAttrs (userName: userData:
      {
        isNormalUser = true;
        description = userData.fullName;
        password = userData.password;
        extraGroups = [ "networkmanager" "scanner" "lp" ] ++ userData.extraGroups;
      }    
    ) userList;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = lib.mapAttrs (userName: userData:
      "${userDir}/${userName}.nix"
    ) userList;
  };
}
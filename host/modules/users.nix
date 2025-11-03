{ config, lib, pkgs, configUsers, ... }:

{
  users = {
    mutableUsers = false;

    users = nixpkgs.lib.mapAttrs (userName: userData:
      {
        isNormalUser = true;
        description = userData.fullName;
        password = userData.password;
        extraGroups = [ "networkmanager" "scanner" "lp" ] ++ userData.extraGroups;
      }    
    ) configUsers;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = nixpkgs.lib.mapAttrs (userName: userData:
      (homeDir + "/${userName}.nix")
    ) configUsers;
  };
}
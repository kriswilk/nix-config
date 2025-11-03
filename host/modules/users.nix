{ config, lib, pkgs, userDir, userList, ... }:

{
  users = {
    mutableUsers = false;
    users = userList;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = lib.mapAttrs (userName: userData:
      "${userDir}/${userName}.nix"
    ) userList;
  };
}
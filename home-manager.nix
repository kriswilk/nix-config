{ config, pkgs, lib, ... }:

let
  mkUserHomeManager = user: userConfig:
  {
    imports = [ "./users/home.nix" ".users/${user}/home.nix" ];
  };
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = lib.mapAttrs mkUserHomeManager config.users.users;
  };
}
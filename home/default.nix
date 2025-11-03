{ config, lib, pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users = {
    guest = import ./guest;
    kris = import ./kris;
  };
}
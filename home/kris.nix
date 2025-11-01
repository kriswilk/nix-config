{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/_all.nix
  ];

  programs = {
    git = {
      settings.user.name = "Kris Wilk";
      settings.user.email = "kris@reefnet.ca";
    };
  };
}
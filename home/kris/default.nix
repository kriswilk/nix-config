{ config, lib, pkgs, ... }:

{
  imports = [ ../. ];

  programs = {
    git = {
      settings.user.name = "Kris Wilk";
      settings.user.email = "kris@reefnet.ca";
    };
  };
}
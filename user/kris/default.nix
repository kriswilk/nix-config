{ config, lib, pkgs, ... }:

{
  imports = [
    ../_modules
  ];

  programs.git = {
    settings.user.name = "Kris Wilk";
    settings.user.email = "kris@reefnet.ca";
  };
}
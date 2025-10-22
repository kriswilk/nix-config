{ config, pkgs, ... }:

{
  imports = [
    ../.
  ];

  home.username = "kris";
  home.homeDirectory = "/home/kris";

  programs.git = {
    enable = true;
    settings.user.name = "Kris Wilk";
    settings.user.email = "kris@reefnet.ca";
  };

  home.packages = with pkgs; [
    btop
  ];
}
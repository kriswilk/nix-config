{ config, pkgs, ... }:

{
  imports = [
    ../. # Common configuration
  ];

  home.username = "kris";
  home.homeDirectory = "/home/kris";

  programs.git = {
    enable = true;
    userName = "Kris Wilk";
    userEmail = "kris@reefnet.ca";
  };
}
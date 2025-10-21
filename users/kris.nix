{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
  ];

  home.username = "kris";
  home.homeDirectory = "/home/kris";

  programs.git = {
    enable = true;
    userName = "Kris Wilk";
    userEmail = "kris@reefnet.ca";
  };

  home.packages = with pkgs; [
    btop
  ];
}
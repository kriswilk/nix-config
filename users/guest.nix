{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
  ];

  home.username = "guest";
  home.homeDirectory = "/home/guest";

  home.packages = with pkgs; [
    htop
  ];
}
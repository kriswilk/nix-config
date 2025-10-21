{ config, pkgs, ... }:

{
  imports = [
    ../.
  ];

  home.username = "guest";
  home.homeDirectory = "/home/guest";

  home.packages = with pkgs; [
    htop
  ];
}
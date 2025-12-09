{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    # WIP: configure settings, extensions, etc...
  };

  home.packages = with pkgs; [
    lynx
  ];
}
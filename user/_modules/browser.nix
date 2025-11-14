{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    # WIP: enable = true;
  };

  home.packages = with pkgs; [
    lynx
  ];
}
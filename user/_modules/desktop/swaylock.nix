{ config, lib, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = lib.mkForce "center";
      font-size = 40;
      indicator-radius = 256;
      indicator-thickness = 20;
      inside-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
    };
  };
}
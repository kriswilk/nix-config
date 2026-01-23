{ config, lib, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = lib.mkForce "center";
      font-size = 30;
      indicator-radius = 128;
      indicator-thickness = 16;
      inside-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
    };
  };
}
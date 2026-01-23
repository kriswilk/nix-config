{ config, lib, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = lib.mkForce "center";
      font-size = 36;
      indicator-radius = 128;
      indicator-thickness = 20;
      inside-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
    };
  };
}
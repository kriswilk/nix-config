{ config, lib, pkgs, ... }:

with config.lib.stylix.colors;
let
  black = base00;
  dark-gray = base02;

  opaque = color: color + "ff";
  transparent = color: color + "00";
in
{
  stylix.targets.swaylock = {
    enable = false;
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = "center";
      indicator-radius = 256;
      indicator-thickness = 18;

      disable-caps-lock-text = true;

      color = black;

      bs-hl-color = red;
      key-hl-color = green;

      # transparent
      inside-color = transparent black;
      inside-clear-color = transparent black;
      inside-ver-color = transparent black;
      inside-wrong-color = transparent black;

      # transparent
      text-color = transparent black;
      text-clear-color = transparent black;
      text-ver-color = transparent black;
      text-wrong-color = transparent black;

      ring-color = dark-gray;
      ring-clear-color = blue;
      ring-ver-color = yellow;
      ring-wrong-color = red;
    };
  };
}
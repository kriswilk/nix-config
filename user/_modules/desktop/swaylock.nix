{ config, lib, pkgs, ... }:

let
  colors = config.lib.stylix.colors;
  colors.black = config.lib.stylix.colors.base00;
  colors.medium-dark-gray = config.lib.stylix.colors.base02;
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

      color = colors.black; # black

      bs-hl-color = colors.red;
      key-hl-color = colors.green;

      # transparent
      inside-color = colors.base00 + "00";
      inside-clear-color = colors.base00 + "00";
      inside-ver-color = colors.base00 + "00";
      inside-wrong-color = colors.base00 + "00";

      # transparent
      text-color = colors.base00 + "00";
      text-clear-color = colors.base00 + "00";
      text-ver-color = colors.base00 + "00";
      text-wrong-color = colors.base00 + "00";

      ring-color = colors.base02; # medium-dark gray
      ring-clear-color = colors.blue;
      ring-ver-color = colors.yellow;
      ring-wrong-color = colors.red;
    };
  };
}
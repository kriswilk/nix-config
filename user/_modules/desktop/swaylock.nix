{ config, lib, pkgs, ... }:

{
  programs.stylix.targets.swaylock = {
    enable = false;
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = "center";
      indicator-radius = 256;
      indicator-thickness = 18;

      color = "000000"; # black

      bs-hl-color = "${config.lib.stylix.colors.base08}"; # red
      key-hl-color = "${config.lib.stylix.colors.base0B}"; # green

      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";

      text-color = "00000000";
      text-clear-color = "00000000";
      text-ver-color = "00000000";
      text-wrong-color = "00000000";

      ring-color = "${config.lib.stylix.colors.base03}AA"; # medium gray
      ring-clear-color = "${config.lib.stylix.colors.base0D}FF"; # blue
      ring-ver-color = "${config.lib.stylix.colors.base0A}FF"; # yellow
      ring-wrong-color = "${config.lib.stylix.colors.base08}FF"; # red

      separator-color = "00000000";
    };
  };
}
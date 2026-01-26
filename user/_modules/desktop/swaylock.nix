{ config, lib, pkgs, ... }:

with config.lib.stylix.colors;
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

      color = "${base00}"; # black

      bs-hl-color = "${red}";
      key-hl-color = "${green}";

      # transparent
      inside-color = "${base00}00";
      inside-clear-color = "${base00}00";
      inside-ver-color = "${base00}00";
      inside-wrong-color = "${base00}00";

      # transparent
      text-color = "${base00}00";
      text-clear-color = "${base00}00";
      text-ver-color = "${base00}00";
      text-wrong-color = "${base00}00";

      ring-color = "${base03}"; # medium gray
      ring-clear-color = "${blue}";
      ring-ver-color = "${yellow}";
      ring-wrong-color = "${red}";
    };
  };
}
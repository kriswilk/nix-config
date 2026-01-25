{ config, lib, pkgs, ... }:

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

      color = "${config.lib.stylix.colors.black}";

      bs-hl-color = "${config.lib.stylix.colors.red}";
      key-hl-color = "${config.lib.stylix.colors.green}";

      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";

      text-color = "00000000";
      text-clear-color = "00000000";
      text-ver-color = "00000000";
      text-wrong-color = "00000000";

      ring-color = "${config.lib.stylix.colors.base03}AA"; # medium gray
      ring-clear-color = "${config.lib.stylix.colors.blue}FF";
      ring-ver-color = "${config.lib.stylix.colors.yellow}FF";
      ring-wrong-color = "${config.lib.stylix.colors.red}FF";
    };
  };
}
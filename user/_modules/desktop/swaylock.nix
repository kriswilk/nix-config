{ config, lib, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = lib.mkForce "center";
      font-size = 36;
      indicator-radius = 256;
      indicator-thickness = 18;

      # transparent
      inside-color = lib.mkForce "${config.lib.stylix.colors.base00}00";

      # clear - blue ring, everything else transparent
      ring-clear-color = lib.mkForce "${config.lib.stylix.colors.base0D}FF";
      inside-clear-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      text-clear-color = lib.mkForce "${config.lib.stylix.colors.base00}00";

      # verify - yellow ring, everything else transparent
      ring-ver-color = lib.mkForce "${config.lib.stylix.colors.base0A}FF";
      inside-ver-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      text-ver-color = lib.mkForce "${config.lib.stylix.colors.base00}00";

      # wrong - red ring, everything else transparent
      ring-wrong-color = lib.mkForce "${config.lib.stylix.colors.base08}FF";
      inside-wrong-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      text-wrong-color = lib.mkForce "${config.lib.stylix.colors.base00}00";

      # caps lock - purple ring, everything else transparent
      line-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base0F}FF";
      text-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
    };
  };
}
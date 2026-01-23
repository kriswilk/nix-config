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

      # transparent inside (to see lock icon)
      inside-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      # ...
      inside-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      inside-clear-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      inside-ver-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      inside-wrong-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      # ...
      text-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      text-clear-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      text-ver-color = lib.mkForce "${config.lib.stylix.colors.base00}00";
      text-wrong-color = lib.mkForce "${config.lib.stylix.colors.base00}00";

      # clear (blue), verify (yellow), wrong (red)
      ring-clear-color = lib.mkForce "${config.lib.stylix.colors.base0D}FF";
      ring-ver-color = lib.mkForce "${config.lib.stylix.colors.base0A}FF";
      ring-wrong-color = lib.mkForce "${config.lib.stylix.colors.base08}FF";

      # caps-lock warning (orange)
      ring-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base09}FF";
    };
  };
}
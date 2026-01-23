{ config, lib, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = lib.mkForce "center";
      font = "monospace";
      font-size = 36;
      indicator-radius = 256;
      indicator-thickness = 18;

      # keypresses
      bs-hl-color = lib.mkForce "${config.lib.stylix.colors.base08}"; # red
      key-hl-color = lib.mkForce "${config.lib.stylix.colors.base0B}"; # green
      # ...
      caps-lock-bs-hl-color = lib.mkForce "${config.lib.stylix.colors.base08}"; # red
      caps-lock-key-hl-color = lib.mkForce "${config.lib.stylix.colors.base0A}"; # yellow

      inside-color = lib.mkForce "00000000";
      # ...
      inside-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base0A}88";
      inside-clear-color = lib.mkForce "00000000";
      inside-ver-color = lib.mkForce "00000000";
      inside-wrong-color = lib.mkForce "00000000";

      text-color = lib.mkForce "FFFFFF";
      # ...
      text-caps-lock-color = lib.mkForce "FFFFFF";
      text-clear-color = lib.mkForce "FFFFFF";
      text-ver-color = lib.mkForce "FFFFFF";
      text-wrong-color = lib.mkForce "FFFFFF";

      ring-color = lib.mkForce "${config.lib.stylix.colors.base05}AA"; # light gray
      # ...
      ring-caps-lock-color = lib.mkForce "${config.lib.stylix.colors.base05}FF"; # light gray
      ring-clear-color = lib.mkForce "${config.lib.stylix.colors.base0D}FF"; # blue
      ring-ver-color = lib.mkForce "${config.lib.stylix.colors.base0A}FF"; # yellow
      ring-wrong-color = lib.mkForce "${config.lib.stylix.colors.base08}FF"; # red

      separator-color = lib.mkForce "00000000";
    };
  };
}
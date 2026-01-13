{ config, lib, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
  };

  services.mako = {
    enable = true;
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 60; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 90; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };

  programs.swaylock = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
  };
  xdg.configFile."waybar/config".source = ./waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  home.packages = with pkgs; [
    #noctalia-shell
    xwayland-satellite
  ];
}
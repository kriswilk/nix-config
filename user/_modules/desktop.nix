{ config, lib, pkgs, ... }:

{
  services.cliphist = {
    enable = true;
  };

  # WIP: remove fuzzel once rofi keybind is configured
  programs.fuzzel = {
    enable = true;
  };
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      
      rofi-calc
      rofi-emoji
      rofi-screenshot
      
      rofi-network-manager
    ];
  };
  services.walker = {
    enable = true;
  };

  services.mako = {
    enable = true;
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      #{ timeout = 60; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      #{ timeout = 90; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;
  };
  xdg.configFile."waybar/config".source = ./waybar/config.jsonc;
  #xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  home.packages = with pkgs; [
    #noctalia-shell
    wl-clipboard
    xwayland-satellite
    rofi-bluetooth
    rofi-power-menu
  ];
}
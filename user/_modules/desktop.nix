{ config, lib, pkgs, ... }:

{
  services.cliphist = {
    enable = true;
  };

  # WIP: remove fuzzel once rofi keybind is configured
  programs.fuzzel = {
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

  programs.tofi = {
    enable = true;
    settings = {
      corner-radius = "5";
    };
  };

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;
  };
  xdg.configFile."waybar/config".source = ./waybar/config.jsonc;
  #xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  home.packages = with pkgs; [
    wl-clipboard
    xwayland-satellite
  ];
}
{ config, lib, pkgs, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  # WIP: remove fuzzel once rofi keybind is configured
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "JetbrainsMonoNL Nerd Font:size=12";
        prompt = "''";
        placeholder = "Begin typing...";
        icons-enabled = "no";
        terminal = "${pkgs.foot}/bin/foot";
        horizontal-pad = 20;
        vertical-pad = 20;
        inner-pad = 20;
        width = 40;
      };
      colors = {
        selection = lib.mkForce (colors.base02 + "FF");
        border = lib.mkForce (colors.base0D + "FF"); # WIP: set color to match niri border...
      };
      border = {
        width = 4;
        radius = 8;
      };
    };
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
    xwayland-satellite
  ];
}
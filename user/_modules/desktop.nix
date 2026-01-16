{ config, lib, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = 40;
        lines = 10;
        horizontal-pad = 25;
        vertical-pad = 25;
        inner-pad = 25;

        prompt = "''";
        placeholder = "Begin typing...";
        icons-enabled = "no";
        keyboard-focus = "on-demand";
        
        font = lib.mkForce "${config.stylix.fonts.monospace.name}:size=14";
      };
      colors = {
        selection = lib.mkForce "#${config.lib.stylix.colors.base02}FF";
        border = lib.mkForce "#${config.lib.stylix.colors.blue}FF"; # WIP: make sure niri border matches!
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
      #{ timeout = 10; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      #{ timeout = 90; command = "systemctl suspend"; }
    ];
    events = {
      before-sleep = "${pkgs.swaylock-effects}/bin/swaylock --daemonize --screenshots --clock --indicator";
    };
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font-size = 30;
      indicator-radius = 150;
      indicator-thickness = 7;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      fade-in = 0.2;
      show-failed-attempts = true;
    };
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
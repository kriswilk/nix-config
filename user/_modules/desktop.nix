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
      #{ timeout = 60; command = "${pkgs.swaylock}/bin/swaylock"; }
      #{ timeout = 90; command = "systemctl suspend"; }
    ];
    events = {
      before-sleep = "${config.programs.swaylock.package}/bin/swaylock -f";
    };
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
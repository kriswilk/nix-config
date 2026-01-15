{ config, lib, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "${config.stylix.fonts.monospace.name}:size=14";
        prompt = "''";
        placeholder = "Begin typing...";
        icons-enabled = "no";
        keyboard-focus = "on-demand";
        terminal = "${pkgs.foot}/bin/foot";

        horizontal-pad = 25;
        vertical-pad = 25;
        inner-pad = 25;
        lines = 10;
        width = 40;
      };
      colors = {
        selection = lib.mkForce "#${config.lib.stylix.colors.base02}FF";
        border = lib.mkForce "#${config.lib.stylix.colors.base0D}FF"; # WIP: make sure niri border matches!
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
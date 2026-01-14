{ config, lib, pkgs, ... }:

{
  # WIP: remove fuzzel once rofi keybind is configured
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "JetbrainsMonoNL Nerd Font:size=12";
        prompt = "\"\"";
        placeholder = "Begin typing...";
        icons-enabled = "no";
        terminal = "${pkgs.foot}/bin/foot";
        horizontal-pad = 20;
        vertical-pad = 20;
        inner-pad = 20;
      };
      colors = {
        background = lib.mkForce "#000000AA";
        border = lib.mkForce "#3ba3f0ff"; # WIP: set color to match niri border...

        text = lib.mkForce "#bbbbbbAA";
        match = lib.mkForce "#eecc00AA";

        selection = lib.mkForce "#000000AA";
        selection-text = lib.mkForce "#FFFFFFAA";
        selection-match = lib.mkForce "#eecc00FF";
      };
      border = {
        width = 4;
        radius = 0;
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

  programs.tofi = {
    enable = true;
    settings = {
      font-size = lib.mkForce 18;

      background-color = lib.mkForce "#000000AA";
      prompt-background = lib.mkForce "#00000000";
      placeholder-background = lib.mkForce "#00000000";
      input-background = lib.mkForce "#00000000";
      default-result-background = lib.mkForce "#00000000";
      selection-background = lib.mkForce "#00000000";

      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-top = "20%";
      padding-bottom = "20%";
      padding-left = "25%";
      padding-right = "25%";
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
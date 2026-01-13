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
      font-size = lib.mkForce 18;
      
      background-color = lib.mkForce "#000000AA";
      prompt-background-color = lib.mkForce "#000000AA";
      placeholder-background-color = lib.mkForce "#000000AA";
      input-background-color = lib.mkForce "#000000AA";
      default-result-background-color = lib.mkForce "#000000AA";
      selection-background-color = lib.mkForce "#000000AA";

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
    wl-clipboard
    xwayland-satellite
  ];
}
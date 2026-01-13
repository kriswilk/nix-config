{ config, lib, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;
  };

  programs.swayidle = {
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

  services.mako = {
    enable = true;
  };

  home.packages = with pkgs; [
    #noctalia-shell
    xwayland-satellite
  ];
}
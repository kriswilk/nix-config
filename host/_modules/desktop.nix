{ config, lib, pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      bigclock = true;
      hide_key_hints = true;
      clear_password = true;
      hide_version_string = true;
    };
  };
  
  services.desktopManager.plasma6.enable = true;

  programs.niri.enable = true;
  
  environment.systemPackages = with pkgs; [
    fuzzel
    alacritty
    swaylock
    xwayland-satellite
    waybar
  ];
}
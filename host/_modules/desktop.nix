{ config, lib, pkgs, ... }:

{
  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # services.displayManager.ly = {
  #   enable = true;
  #   settings = {
  #     animation = "matrix";
  #     bigclock = true;
  #     hide_key_hints = true;
  #     clear_password = true;
  #     hide_version_string = true;
  #   };
  # };

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
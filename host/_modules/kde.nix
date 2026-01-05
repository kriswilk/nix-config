{ config, lib, pkgs, ... }:

{
  #services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.ly.enable = true;
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    fuzzel
    alacritty
    swaylock
    xwayland-satellite
  ];
}
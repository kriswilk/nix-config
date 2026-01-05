{ config, lib, pkgs, ... }:

{
  #services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.gdm.enable = true;
  programs.niri.enable = true;
}
{ config, lib, pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "doom";
      bigclock = "en";
      bigclock_12hr = true;
      bigclock_seconds = true;

      box_title = "Welcome to NixOS";

      #hide_key_hints = true;
      clear_password = true;
      #hide_version_string = true;
      save = true;
      input_len = 20;
      text_in_center = true;
    };
  };

  services.desktopManager.plasma6.enable = true;

  # WIP: Niri needs a lot more configuration to be usable...
  # programs.niri.enable = true;
  
  # environment.systemPackages = with pkgs; [
  #   fuzzel
  #   alacritty
  #   swaylock
  #   xwayland-satellite
  #   waybar
  # ];
}
{ config, lib, pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      hide_key_hints = true;
      hide_version_string = true;
      input_len = 24;
      text_in_center = true;
      clear_password = true;
      save = true;
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
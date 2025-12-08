{ config, lib, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
  };
  
  home.packages = with pkgs; [
    # general purpose
    noto-fonts
    noto-fonts-color-emoji
    # monospace / programming
    nerd-fonts.jetbrains-mono
  ];
}
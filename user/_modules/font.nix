{ config, lib, pkgs, ... }:

{
  fonts = {
    fontconfig.enable = true;
  };
  
  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-color-emoji
  ];
}
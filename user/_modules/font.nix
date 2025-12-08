{ config, lib, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
  };

  home.packages = with pkgs; [
    # general purpose fonts
    noto-fonts
    noto-fonts-color-emoji
    # programming
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];
}
{ config, lib, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
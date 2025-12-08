{ config, lib, pkgs, ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "JetBrainsMonoNL Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  
  home.packages = with pkgs; [
  ];
}
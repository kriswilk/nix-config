{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    
    override = {
      # pure black background
      scheme = "gruvbox-dark-hard-black";
      base00 = "000000";
    };
  };
}
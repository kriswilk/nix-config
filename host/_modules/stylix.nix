{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    
    # override = {
    #   scheme = "Catppuccin Mocha OLED";
    #   base00 = "000000";
    # };
  };
}
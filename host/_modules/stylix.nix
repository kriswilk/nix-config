{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    
    override = {
      base00 = "000000";
    };
  };
}
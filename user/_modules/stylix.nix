{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    
    # override = {
    #   base00= "#000000"; # black
    #   base01= "#242424"; # gray01
    #   base02= "#494949"; # gray02
    #   base03= "#6d6d6d"; # gray03
    #   base04= "#929292"; # gray04
    #   base05= "#b6b6b6"; # gray05
    #   base06= "#dbdbdb"; # gray06
    #   base07= "#ffffff"; # white
    #   base08= "#e95e77"; # red
    #   base09= "#fc6d24"; # orange
    #   base0A= "#fda331"; # yellow
    #   base0B= "#a1c659"; # green
    #   base0C= "#76c7b7"; # cyan
    #   base0D= "#6fb3d2"; # blue
    #   base0E= "#d381c3"; # purple
    #   base0F= "#be643c"; # brown
    # };
    override = {
      base00= "#000000"; # black
      base01= "#242424"; # gray01
      base02= "#494949"; # gray02
      base03= "#6d6d6d"; # gray03
      base04= "#929292"; # gray04
      base05= "#b6b6b6"; # gray05
      base06= "#dbdbdb"; # gray06
      base07= "#ffffff"; # white
      base08= "#eb4f6c"; # red
      base09= "#ff6a2f"; # orange
      base0A= "#fda331"; # yellow
      base0B= "#98c440"; # green
      base0C= "#60c9c0"; # cyan
      base0D= "#4baad6"; # blue
      base0E= "#d675c3"; # purple
      base0F= "#bd6023"; # brown
    };
  };
}
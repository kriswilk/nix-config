{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    base16Scheme = {
      system = "base16";
      name = "oh-cee-dee";
      author = "Kris Wilk (https://github.com/kriswilk)";
      variant = "dark";

      palette = {
        base00 = "#000000"; # black
        base01 = "#222222"; # gray ---
        base02 = "#444444"; # gray --
        base03 = "#666666"; # gray -
        base04 = "#999999"; # gray +
        base05 = "#bbbbbb"; # gray ++
        base06 = "#dddddd"; # gray +++
        base07 = "#ffffff"; # white
        base08 = "#ee5555"; # red
        base09 = "#ff8833"; # orange
        base0A = "#eecc00"; # yellow
        base0B = "#99bb44"; # green
        base0C = "#66ccbb"; # cyan
        base0D = "#4499dd"; # blue
        base0E = "#cc77bb"; # purple
        base0F = "#bb6622"; # brown
      };
    };
  };
}
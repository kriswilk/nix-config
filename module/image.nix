{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    imagemagick
    resvg

    #gimp3
    #inkscape
    #krita
  ];
}
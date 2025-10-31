{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    #blender
    #freecad
    #kicad
    #prusa-slicer
  ];
}
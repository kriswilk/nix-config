{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #imhex
    nano

    #kdePackages.kate # already installed?
  ];
}
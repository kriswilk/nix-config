{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    #naps2
  ];
}
{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    audacity
  ];
}
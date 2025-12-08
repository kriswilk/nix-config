{ config, lib, pkgs, ... }:

{
  programs.nh = {
    enable = true;
  };

  home.packages = with pkgs; [
    comma
    steam-run
  ];
}
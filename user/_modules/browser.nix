{ inputs, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

  };

  home.packages = with pkgs; [
    lynx
  ];
}
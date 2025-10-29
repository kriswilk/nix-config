{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    #jdk
    #prismlauncher
  ];
}
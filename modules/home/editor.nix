{ config, lib, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };

  home.packages = with pkgs; [
    #imhex
    nano

    #kdePackages.kate # already installed?
  ];
}
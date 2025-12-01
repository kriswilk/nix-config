{ config, lib, pkgs, ... }:

{
  imports = [ inputs.nvf.homeManagerModules.default ];

  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   vimdiffAlias = true;
  # };

  home.packages = with pkgs; [
    #imhex
    nano

    #kdePackages.kate # already installed?
  ];
}
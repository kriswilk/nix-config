{ config, lib, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = false;
      vim.lsp = {
        enable = true;
      };
    };
  };

  home.packages = with pkgs; [
    #imhex
    nano

    #kdePackages.kate # already installed?
  ];
}
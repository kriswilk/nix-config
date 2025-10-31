{ config, lib, pkgs, listNixFilesRecursive, ... }:

{
  imports = listNixFilesRecursive ./_module;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
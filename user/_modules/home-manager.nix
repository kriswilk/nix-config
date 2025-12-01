{ config, lib, pkgs, ... }:

{
  imports = [ nvf.homeManagerModules.default ];

  home.stateVersion = "25.05";

  programs.home-manager = {
    enable = true;
  };
}
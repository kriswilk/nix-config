{ config, lib, pkgs, nvf, ... }:

{
  imports = [ nvf.homeManagerModules.default ];

  home.stateVersion = "25.05";

  programs.home-manager = {
    enable = true;
  };
}
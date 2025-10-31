{ config, lib, pkgs, importDirModules, ... }:

{
  imports = [
    (importDirModules ./_module)
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
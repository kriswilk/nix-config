{ config, lib, pkgs, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: file.hasExt "nix" && ! file.hasPrefix "_") ../module/home
  );

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
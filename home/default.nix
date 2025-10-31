{ config, lib, pkgs, importDirModules, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: file.hasExt "nix") ./_module
  );

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
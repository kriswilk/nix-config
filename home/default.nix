{ config, lib, pkgs, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: file.hasExt "nix" && ! builtins.hasPrefix "_" file.name) ../module/home
  );

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
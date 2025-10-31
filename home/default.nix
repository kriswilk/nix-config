{ config, lib, pkgs, listNixFilesRecursive, ... }:


{
  imports = dir: lib.fileset.toList (
      lib.fileset.fileFilter (file: file.hasExt "nix" && ! lib.hasPrefix "_" file.name) ./_module
    );

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
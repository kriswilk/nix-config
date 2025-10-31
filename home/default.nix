{ config, lib, pkgs, importDirModules, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: lib.hasSuffix ".nix" file.name) ./_module
  );

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
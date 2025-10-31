{ config, lib, pkgs, listNixFilesRecursive, ... }:

{
  imports = dir: lib.fileset.toList (
      lib.fileset.fileFilter (file: file.hasExt "nix" && ! lib.hasPrefix "_" file.name) ./_module
    );

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

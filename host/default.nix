{ config, lib, pkgs, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: file.hasExt "nix" && ! lib.hasPrefix "_" file.name) ../module/host
  );

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

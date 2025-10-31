{ config, lib, pkgs, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: lib.hasSuffix ".nix" file.name) ./_module
  );

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

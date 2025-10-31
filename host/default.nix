{ config, lib, pkgs, listNixFilesRecursive, ... }:

{
  imports = listNixFilesRecursive ./_module;

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

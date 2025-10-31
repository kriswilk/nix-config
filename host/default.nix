{ config, lib, pkgs, ... }:

let
  moduleLib = import ./lib/importers.nix { inherit lib; };
in
{
  imports = moduleLib.importAllNixFiles ./_module;

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

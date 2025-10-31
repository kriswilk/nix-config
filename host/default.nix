{ config, lib, pkgs, moduleLib, ... }:

{
  imports = moduleLib.importAllNixFiles ./_module;

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

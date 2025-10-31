{ config, lib, pkgs, importDirModules, ... }:

{
  imports = [
    (importDirModules ./_module)
  ];

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

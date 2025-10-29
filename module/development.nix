{ config, lib, pkgs, ... }:

{
  programs = {
    git.enable = true;
    #vscode.enable = true;
    # WIP: need FHS package? further config?
  };

  home.packages = with pkgs; [
    gcc
    gnumake
  ];
}
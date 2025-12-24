{ config, lib, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/kris/nix-config";
  };

  programs.nix-index = {
    enable = true;
  };

  programs.nix-index-database = {
    comma.enable = true;
  };

  home.packages = with pkgs; [
    steam-run
  ];
}
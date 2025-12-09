{ config, lib, pkgs, ... }:

{
  programs.nh = {
    enable = true;
  };

  programs.nix-index = {
    enable = true;
    # WIP: Integrates with command-not-found, but slows the prompt when a typo is made.
    #      Better to just use nix-locate / comma to search for missing commands?
    #enableBashIntegration = true;
  };

  programs.nix-index-database = {
    comma.enable = true;
  };

  home.packages = with pkgs; [
    steam-run
  ];
}
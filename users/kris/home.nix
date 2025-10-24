{ config, lib, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      settings.user.name = "Kris Wilk";
      settings.user.email = "kris@reefnet.ca";
    };
  };

  home.packages = with pkgs; [
    # ...
    cowsay
  ];
}
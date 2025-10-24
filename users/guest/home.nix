{ config, lib, pkgs, ... }:

{
  home = {
    username = "guest";
    homeDirectory = "/home/guest";
  };

  programs = {
    # ...
  };

  home.packages = with pkgs; [
    # ...
  ];
}
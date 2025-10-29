{ config, lib, pkgs, ... }:

{
  programs = {
    #kitty.enable = true;
    tmux.enable = true;
  };

  home.packages = with pkgs; [
    # ...
  ];
}
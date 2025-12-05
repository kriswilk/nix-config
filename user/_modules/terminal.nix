{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
  };

  programs.ghostty = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };
}
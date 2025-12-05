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

  programs.wezterm = {
    enable = true;
  };

  programs.foot = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };
}
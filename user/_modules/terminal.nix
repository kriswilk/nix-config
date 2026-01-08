{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        resize_by_cells = false;
        pad = "4x4 center-when-maximized-and-fullscreen";
      };
    };
  };

  # WIP: eventually remove this in favor of "foot" only?
  # programs.kitty = {
  #   enable = true;
  #   settings = {
  #     text_composition_strategy = "legacy";
  #     window_padding_width = 4;
  #   };
  # };

  programs.tmux = {
    enable = true;
  };
}
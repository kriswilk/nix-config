{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        resize-by-cells = false;
        resize-keep-grid = "no";
        pad = "8x8 center-when-maximized-and-fullscreen";
      };
      csd = {
        preferred = "none";
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
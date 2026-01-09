{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "5x5";
        resize-by-cells = false;
        resize-keep-grid = "no";
      };
      csd = {
        preferred = "none";
      };
      scrollback = {
        lines = 10000;
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
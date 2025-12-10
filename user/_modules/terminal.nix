{ config, lib, pkgs, ... }:

{
  programs.foot = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      text_composition_strategy = "legacy";
      window_padding_width = 4;
    };
  };

  programs.tmux = {
    enable = true;
  };
}
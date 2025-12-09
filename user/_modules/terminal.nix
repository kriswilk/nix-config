{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      text_composition_strategy = "legacy";
      window_padding_width = 4;
    };
  };

  programs.foot = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };
}
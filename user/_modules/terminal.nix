{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      #text_composition_strategy = "legacy";
    };
  };

  programs.foot = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };
}
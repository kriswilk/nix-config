{ config, lib, pkgs, ... }:

{
  # specify default (env)
  home.sessionVariables = {
    BROWSER = "firefox";
  };

  # specify default (xdg)
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "foot.desktop" ];
    };
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

  programs.tmux = {
    enable = true;
  };
}
{ config, lib, pkgs, ... }:

with config.lib.stylix.colors;
let
  black = base00;
  medium-dark-gray = base02;

  transparent = color: color + "00";
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = 40;
        lines = 10;
        horizontal-pad = 25;
        vertical-pad = 25;
        inner-pad = 25;

        prompt = "''";
        placeholder = "Begin typing...";
        icons-enabled = "no";
        keyboard-focus = "on-demand";
        
        font = lib.mkForce "monospace:size=14";
      };
      colors = {
        selection = lib.mkForce medium-dark-gray;
        border = lib.mkForce blue; # WIP: make sure niri border matches!
      };
      border = {
        width = 4;
        radius = 8;
      };
    };
  };
}
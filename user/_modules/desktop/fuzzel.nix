{ config, lib, pkgs, ... }:

with config.lib.stylix.colors;
let
  black = base00;
  dark-gray = base02;

  opaque = color: color + "ff";
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
        match-counter = true;
        icons-enabled = "no";
        keyboard-focus = "on-demand";
        cache = "/dev/null";

        font = lib.mkForce "monospace:size=14";
      };
      colors = {
        border = lib.mkForce (opaque blue); # WIP: make sure niri border matches!
        placeholder = lib.mkForce (opaque dark-gray);
        counter = lib.mkForce (opaque dark-gray);
        selection = lib.mkForce (opaque dark-gray);
      };
      border = {
        width = 4;
        radius = 8;
      };
    };
  };
}
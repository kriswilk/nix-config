{ config, lib, pkgs, ... }:

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
        
        font = lib.mkForce "${config.stylix.fonts.monospace.name}:size=14";
      };
      colors = {
        selection = lib.mkForce "#${config.lib.stylix.colors.base02}FF";
        border = lib.mkForce "#${config.lib.stylix.colors.blue}FF"; # WIP: make sure niri border matches!
      };
      border = {
        width = 4;
        radius = 8;
      };
    };
  };
}
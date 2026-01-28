{ config, lib, pkgs, ... }:

let
  script = pkgs.writeShellApplication {
    name = "menu-clipboard";
    text = ''
      dmenu="fuzzel --dmenu --minimal-lines"
      cliphist list | $dmenu | cliphist decode | wl-copy
    '';
  };
in
{
  home.packages = [
    script
  ];
}
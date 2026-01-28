{ config, lib, pkgs, ... }:

let
  script = pkgs.writeShellApplication {
    name = "manu-clipboard";
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
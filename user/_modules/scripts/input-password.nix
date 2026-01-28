{ config, lib, pkgs, ... }:

let
  script = pkgs.writeShellApplication {
    name = "input-password";
    text = ''
      fuzzel --dmenu \
            --prompt-only "󰌆  " \
            --placeholder "" \
            --password \
            --width 30
    '';
  };
in
{
  home.packages = [
    script
  ];
}
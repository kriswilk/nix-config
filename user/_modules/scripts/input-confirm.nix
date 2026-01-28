{ config, lib, pkgs, ... }:

let
  script = pkgs.writeShellApplication {
    name = "input-confirm";
    text = ''
      fuzzel --dmenu \
            --prompt-only "Type 'yes' to confirm: " \
            --placeholder "" \
            --auto-select \
            --width 30
    '';
  };
in
{
  home.packages = [
    script
  ];
}
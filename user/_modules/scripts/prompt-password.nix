{ config, lib, pkgs, ... }:

let
  script = pkgs.writeShellApplication {
    name = lib.strings.removeSuffix ".nix" (builtins.baseNameOf ./.);
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
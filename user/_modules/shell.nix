{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra =
      ''
        source -- ${pkgs.blesh}/share/blesh/ble.sh
      '';
  };

  programs.direnv = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = lib.importTOML ./starship/starship.toml;
  };

  home.packages = with pkgs; [
    blesh
  ];

  home.shellAliases = {
    # cd
    ".." = "cd ..";

    # ls
    ls = "ls --color=tty";
    ll = "ls -l";
    l = "ls -alh";
  };
}
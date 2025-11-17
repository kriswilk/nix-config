{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      python.symbol = ' ';
    };
  };

  home.shellAliases = {
    # cd
    ".." = "cd ..";

    # ls
    ls = "ls --color=tty";
    ll = "ls -l";
    l = "ls -alh";
  };
}
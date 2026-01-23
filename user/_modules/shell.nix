{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
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
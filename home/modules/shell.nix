{ config, lib, pkgs, ... }:

{
  programs = {
    bash.enable = true;
    direnv.enable = true;
    starship.enable = true;
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
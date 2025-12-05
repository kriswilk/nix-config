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
    settings = lib.mkMerge [
      (builtins.fromTOML
        (builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml"
      ))
      {
        # WIP: other custom configuration here
        username.format = "[$user]($style)@";
        hostname.format = "[$hostname]($style) in ";
        hostname.style = "bold orange";
      }
    ];
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
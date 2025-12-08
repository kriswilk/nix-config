{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      source -- "${pkgs.blesh}/share/blesh/ble.sh"
    '';
  };

  programs.direnv = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = lib.mkMerge [
      (builtins.fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml"))
      (builtins.fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/no-empty-icons.toml"))
      {
        # WIP: other custom configuration here

        format = "$sudo$username$hostname$directory$git_branch$git_commit$git_state$git_metrics$git_status$docker_context$package$fill$all";

        fill = {
          style = "bright-black";
        };

        sudo ={
          disabled = false;
          symbol = "󰒃";
          format = "[$symbol]($style) ";
          style = "bold red";
        };

        username = {
          show_always = true;
          format = "[$user]($style) / ";
        };

        hostname = {
          ssh_only = false;
          ssh_symbol = lib.mkForce " ";
          format = "[$ssh_symbol$hostname]($style) / ";
          style = "bold green";
        };

        directory = {
          style = "bold blue";
        };

        cmd_duration = {
          format = "󱎫 [$duration]($style) ";
        };
      }
    ];
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
{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      source ${pkgs.blesh}/share/blesh/ble.sh
    '';
  };

  programs.direnv = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = lib.mkMerge [
      #(builtins.fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml"))
      #(builtins.fromTOML (builtins.readFile "${pkgs.starship}/share/starship/presets/no-empty-icons.toml"))
      {
        # WIP: other custom configuration here
        username.show_always = true;
        username.format = "[$user]($style) / ";

        hostname.ssh_only = false;
        hostname.ssh_symbol = lib.mkForce " ";
        hostname.format = "[$ssh_symbol$hostname]($style) / ";
        hostname.style = "bold green";
        
        directory.style = "bold blue";

        format = "$directory$character";
        right_format = "$all";
        #line_break.disabled = true;
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
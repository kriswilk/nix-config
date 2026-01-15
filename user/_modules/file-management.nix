{ config, lib, pkgs, ... }:

{
  # WIP: yazi needs xclip / wl-clipboard / xsel ?

  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        prepend_keymap = [
          { on = "<Enter>"; run = "enter"; desc = "Enter child directory"; }
        ];
      };
    };
  };

  programs.zoxide = {
    enable = true;
  };

  home.packages = with pkgs; [
    curl
    file
    rclone
    rsync
    tree
    wget

    nemo
    krename
    bcompare

    # WIP: kdePackages.ark # already installed?
    # WIP: kdePackages.filelight # already installed?
    # WIP: kdePackages.k3b # already installed?
    # WIP: onedrive, gdrive ?
    # WIP: qbittorrent
    # WIP: jdownloader2
  ];
}
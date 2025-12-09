{ config, lib, pkgs, ... }:

{
  # WIP: yazi needs xclip / wl-clipboard / xsel ?

  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  home.packages = with pkgs; [
    curl
    file
    rclone
    rsync
    tree
    wget

    # WIP: bcompare
    # WIP: kdePackages.ark # already installed?
    # WIP: kdePackages.filelight # already installed?
    # WIP: kdePackages.k3b # already installed?
    # WIP: krename # anything better?
    # WIP: onedrive, gdrive ?
    # WIP: qbittorrent
    # WIP: jdownloader2
  ];
}
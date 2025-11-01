{ config, lib, pkgs, ... }:

{
  programs = {
    yazi.enable = true;
    fd.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
    #xclip / wl-clipboard / xsel # Linux clipboard support, needed by yazi?
  };

  home.packages = with pkgs; [
    curl
    file
    rclone
    rsync
    tree
    wget

    #bcompare
    #kdePackages.ark # already installed?
    #kdePackages.filelight # already installed?
    #kdePackages.k3b # already installed?
    # WIP: krename # anything better?
    # WIP: onedrive, gdrive ?
    # WIP: qbittorrent
    # WIP: jdownloader2
  ];
}
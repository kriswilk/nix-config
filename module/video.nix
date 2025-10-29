{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    ffmpeg
    mkvtoolnix

    #handbrake
    #stremio
    #vlc
  ];
}
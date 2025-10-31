{ config, lib, pkgs, ... }:

{
  programs = {
    # ...
  };

  home.packages = with pkgs; [
    fio
    smartmontools
    # WIP: ventoy
  ];
}
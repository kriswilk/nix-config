{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    blesh.enable = true;
  };
}
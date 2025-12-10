{ config, lib, pkgs, hostName, ... }:

{
  programs.bash = {
    enable = true;
  };

  programs.fish = {
    enable = true;
  };
}
{ config, lib, pkgs, ... }:

{
  programs.nano = {
    enable = true;
  };
  
  programs.vim = {
    enable = true;
  };
}
{ config, lib, pkgs, ... }:

{
  home.file = {
    ".local/bin" = {
      source = ./.;
      recursive = true;
    };
  };
}
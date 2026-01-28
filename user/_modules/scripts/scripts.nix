{ config, lib, pkgs, ... }:

{
  home.file = {
    ".local/bin" = {
      source = ./.local/bin;
      recursive = true;
    };
  };
}
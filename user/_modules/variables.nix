{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    TERMINAL = "foot";
  };
}
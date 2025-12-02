{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    NH_FLAKE = "/home/kris/nix-config";
  };
}
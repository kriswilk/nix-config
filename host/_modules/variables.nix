{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    NH_FLAKE = "~/nix-config";
  };
}
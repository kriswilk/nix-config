{ config, lib, pkgs, ... }:

{
  environment.sessionVariables = {
    NH_FLAKE = "/etc/nixos";
  };
}
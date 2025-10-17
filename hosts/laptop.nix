{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
    ../hardware-configuration.nix
  ];
  
  # Hostname
  networking.hostName = "laptop";
}

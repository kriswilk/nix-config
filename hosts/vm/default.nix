{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./disko.nix
      ../.
    ];

  # Host-specific system configuration
  
  # Hostname
  networking.hostName = "vm";
}

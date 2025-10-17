{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
    ../hardware-configuration.nix
  ];
  
  # Hostname
  networking.hostName = "vm";

  # VirtualBox guest additions
  virtualisation.virtualbox.guest.enable = true;
}

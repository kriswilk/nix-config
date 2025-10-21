{ config, pkgs, ... }:

{
  imports = [
    ../.
    ./hardware-configuration.nix
  ];

  # Disko target
  disko.devices.disk.main.device = "/dev/sda";

  # Hostname
  networking.hostName = "vm";

  # VirtualBox guest additions
  virtualisation.virtualbox.guest.enable = true;
}

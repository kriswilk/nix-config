{ config, pkgs, ... }:

{
  imports = [
    ../. # Common configuration
    ./hardware-configuration.nix
  ];

  # Use `sudo lsblk` and `sudo blkid` to find the name / UUID of the target disk
  disko.devices.disk.primary.device = "/dev/sda";
  
  # Hostname
  networking.hostName = "vm";
}

{ config, pkgs, ... }:

{
  imports = [
    ../. # Common configuration
    ./hardware-configuration.nix
  ];
    
  # Use `sudo lsblk` and `sudo blkid` to find the name / UUID of the target disk
  disko.devices.disk.primary.device = "/dev/XXX OR /dev/disk/by-uuid/<UUID>";
  
  # Hostname
  networking.hostName = "hostname";
}

{ config, pkgs, ... }:

{
  imports = [
    ../. # Common configuration
    ./hardware-configuration.nix
  ];

  # Use `sudo lsblk` and `sudo blkid` to find the name / UUID of the target disk
  disko.devices.disk.primary.device = "/dev/nvme0n1";
  
  # Hostname
  networking.hostName = "desktop-htpc";

  # GPU - NVIDIA GTX 1070
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = true;
  }; 
}

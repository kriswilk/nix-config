{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ../.
  ];

  # target disk
  disko.devices.disk.main.device = "/dev/nvme0n1";

  # hostname
  networking.hostName = "desktop";

  ##################################
  ##### HARDWARE CONFIGURATION #####
  ##################################

  throw "System-specific hardware configuration not provided.";

  ##################################
  ##### CUSTOM CONFIGURATION #####
  ##################################

  # GPU - NVIDIA GTX 1070
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
}

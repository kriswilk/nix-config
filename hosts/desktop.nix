{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./_common.nix
  ];

  # Disko target
  disko.devices.disk.main.device = "/dev/nvme0n1";

  # Hostname
  networking.hostName = "desktop";

  # GPU - NVIDIA GTX 1070
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;

  ##################################
  ##### HARDWARE CONFIGURATION #####
  ##################################

  throw "System-specific hardware configuration not provided.";
}

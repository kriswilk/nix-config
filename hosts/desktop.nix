{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
    ../hardware-configuration.nix
  ];

  # Disko target
  disko.devices.disk.main.device = "/dev/nvme0n1";

  # Hostname
  networking.hostName = "desktop";

  # GPU - NVIDIA GTX 1070
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
}

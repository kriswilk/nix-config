{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
    ../hardware-configuration.nix
  ];
  
  # Hostname
  networking.hostName = "desktop";

  # GPU - NVIDIA GTX 1070
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
}

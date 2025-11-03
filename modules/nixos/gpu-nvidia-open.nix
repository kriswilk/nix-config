{ config, lib, pkgs, ... }:

{
  options = lib.mkOption {
    gpu-nvidia-open.enable = lib.mkEnableOption "Enable NVIDIA open-source drivers.";
  };

  config = lib.mkIf config.gpu-nvidia-open.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
  };
}
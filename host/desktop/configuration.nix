{ config, lib, pkgs, ... }:

{
  # gpu - nvidia gtx 1070
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # ...
}

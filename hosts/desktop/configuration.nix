{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  disko.devices.disk.main.device = "/dev/nvme0n1";
  gpu-nvidia-open.enable = true;
}
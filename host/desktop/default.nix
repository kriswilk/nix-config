{ config, lib, pkgs, ... }:

{
  imports = [
    ../_modules
    ./hardware-configuration.nix
  ];

  disko.devices.disk.main.device = "/dev/nvme0n1";
  gpu-nvidia-open.enable = true;
}
{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../.
    ../_module/_gpu_nvidia_open.nix
  ];

  disko.devices.disk.main.device = "/dev/nvme0n1";
}

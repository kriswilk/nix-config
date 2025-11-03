{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  disko.devices.disk.main.device = "/dev/nvme0n1";
  gpu-nvidia-open.enable = true;

  ### hardware-configuration.nix ###

  # ... paste here ...
}
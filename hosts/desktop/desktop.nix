{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/_all.nix
  ];

  disko.devices.disk.main.device = "/dev/nvme0n1";
  gpu-nvidia-open.enable = true;

  ### hardware-configuration.nix #############################################
  
  throw "Include the contents of hardware-configuration.nix in the host configuration!"
}
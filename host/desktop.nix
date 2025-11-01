{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/_common.nix
    ./modules/_gpu_nvidia_open.nix
  ];

  disko.devices.disk.main.device = "/dev/nvme0n1";

  ### hardware-configuration.nix #############################################
  
  throw "Include the contents of hardware-configuration.nix in the host configuration!"
}

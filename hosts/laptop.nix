{ config, pkgs, ... }:

{
  imports = [
    ./_common.nix
    ../hardware-configuration.nix
  ];

  # Disko target
  disko.devices.disk.main.device = "/dev/nvme0n1";

  # Hostname
  networking.hostName = "laptop";
}

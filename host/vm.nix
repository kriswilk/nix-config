{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../.
  ];

  disko.devices.disk.main.device = "/dev/sda";
}

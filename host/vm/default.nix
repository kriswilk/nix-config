{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../_modules
  ];

  disko.devices.disk.main.device = "/dev/sda";
}
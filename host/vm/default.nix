{ config, lib, pkgs, ... }:

{
  imports = [
    ../_modules
    ./hardware-configuration.nix
  ];

  disko.devices.disk.main.device = "/dev/sda";
}
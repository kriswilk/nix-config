{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ../.
  ];

  # target disk
  disko.devices.disk.main.device = "/dev/<DEVICE>";

  # hostname
  networking.hostName = "<HOSTNAME>";

  ##### HARDWARE CONFIGURATION #####

  throw "System-specific hardware configuration not provided.";

  ##### CUSTOM CONFIGURATION #####

  # add host-specific configuration here
}

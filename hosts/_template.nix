{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./_common.nix
  ];

  # Disko target
  disko.devices.disk.main.device = "/dev/<DEVICE>";

  # Hostname
  networking.hostName = "<HOSTNAME>";

  ##################################
  ##### HARDWARE CONFIGURATION #####
  ##################################

  throw "System-specific hardware configuration not provided.";
}

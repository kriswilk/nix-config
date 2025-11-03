{ config, lib, pkgs, configName, ... }:

{
  networking.hostName = configName;

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  services.openssh.enable = true;
}
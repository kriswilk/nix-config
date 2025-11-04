{ config, lib, pkgs, hostName, ... }:

{
  networking.hostName = hostName;

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  }
}
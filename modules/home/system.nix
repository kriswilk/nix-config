{ config, lib, pkgs, ... }:

{
  programs = {
    btop.enable = true;
    fastfetch.enable = true;
  };

  home.packages = with pkgs; [
    ethtool
    lm_sensors
    lsof
    ltrace
    pciutils
    strace
    sysstat
    usbutils
  ];
}
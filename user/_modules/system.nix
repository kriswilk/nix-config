{ config, lib, pkgs, ... }:

{
  programs.btop = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  home.packages = with pkgs; [
    ethtool
    lm_sensors
    lsof
    ltrace
    neofetch
    pciutils
    strace
    sysstat
    usbutils
  ];
}
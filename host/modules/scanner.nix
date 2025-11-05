{ config, lib, pkgs, ... }:

{
  imports = [
    
  ];

  hardware.sane = {
    enable = true;
    brscan4 = {
        enable = true;
        netDevices = {
          home = { model = "DCP-7065DN"; ip = "10.0.0.203"; };
        };
      };
  };
  # WIP needs testing/config
}
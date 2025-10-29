{ config, lib, pkgs, configName, ... }:

{
  services.printing = {
    enable = true;
    # WIP needs testing/config
  };

  hardware.sane.enable = true;
  # WIP needs testing/config
}

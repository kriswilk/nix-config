{ config, lib, pkgs, ... }:

{
  services.printing = {
    enable = true;
    # WIP needs testing/config
  };

  hardware.printers = {
    ensureDefaultPrinter = "Canon Laser";
    ensurePrinters = [
      {
        deviceUri = "ipp://10.0.0.216/ipp";
        location = "home";
        name = "Canon Laser";
        model = "everywhere";
      }
    ];
  };

  hardware.sane = {
    enable = true;
  };
  # WIP needs testing/config
}
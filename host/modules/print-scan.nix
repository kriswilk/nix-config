{ config, lib, pkgs, ... }:

{
  services.printing = {
    enable = true;
    # WIP needs testing/config
  };

  hardware.printers = {
    ensureDefaultPrinter = "printer-kris";
    ensurePrinters = [
      {
        deviceUri = "ipp://10.0.0.216/ipp";
        location = "home";
        name = "printer-kris";
        model = "everywhere";
      }
    ];
  };

  hardware.sane = {
    enable = true;
  };
  # WIP needs testing/config
}
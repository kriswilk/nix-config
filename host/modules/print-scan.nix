{ config, lib, pkgs, ... }:

{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  # hardware.printers = {
  #   ensureDefaultPrinter = "printer-office";
  #   ensurePrinters = [
  #     {
  #       deviceUri = "ipp://10.0.0.215/ipp";
  #       name = "printer-office";
  #       description = "Canon MF455dw";
  #       model = "everywhere";
  #     }
  #     {
  #       deviceUri = "ipp://10.0.0.216/ipp";
  #       name = "printer-kris";
  #       description = "Canon MF455dw";
  #       model = "everywhere";
  #     }
  #     {
  #       deviceUri = "ipp://10.0.0.203:631/ipp";
  #       name = "printer-daniela";
  #       description = "Brother DCP-7065DN";
  #       model = "everywhere";
  #     }
  #   ];
  # };

  hardware.sane = {
    enable = true;
  };
  # WIP needs testing/config
}
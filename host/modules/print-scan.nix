{ config, lib, pkgs, ... }:

{
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  # };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    #   # common driver packages as per wiki.nixos.org
      gutenprint # Drivers for many different printers from many different vendors.
    #   gutenprintBin # Additional, binary-only drivers for some printers.
    #   hplip # Drivers for HP printers.
    #   postscript-lexmark # Postscript drivers for Lexmark
    #   samsung-unified-linux-driver # Proprietary Samsung Drivers
    #   splix # Drivers for printers supporting SPL (Samsung Printer Language).
    #   brlaser # Drivers for some Brother printers
    #   brgenml1lpr # Generic drivers for more Brother printers (Proprietary drivers)
    #   brgenml1cupswrapper # Generic drivers for more Brother printers (Proprietary drivers)
    #   cnijfilter2 # Drivers for some Canon Pixma devices (Proprietary driver)
    #   epson-escpr2 # Drivers for newer Epson devices.
    #   epson-escpr # Drivers for some other Epson devices.
    ];
  };

  hardware.printers.ensurePrinters = [
    { name        = "printer-office";
      description = "Canon MF455dw";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.215:9100";
      model       = "gutenprint.5.3://pcl-g_5/expert";
    }
    { name        = "printer-kris";
      description = "Canon MF455dw";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.216:9100";
      model       = "gutenprint.5.3://pcl-g_5/expert";
    }
    { name        = "printer-daniela";
      description = "Brother DCP-7065DN";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.203:9100";
      model       = "gutenprint.5.3://pcl-g_5/expert";
    }
  ];


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
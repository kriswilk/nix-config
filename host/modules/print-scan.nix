{ config, lib, pkgs, ... }:

{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.printing = {
    enable = true;
    browsed.enable = false;
    drivers = with pkgs; [
      brgenml1lpr
      brgenml1cupswrapper
    ];
  };

  hardware.printers.ensurePrinters = [
    { name        = "fathoms-office";
      description = "Canon MF455dw";
      deviceUri   = "socket://10.0.0.215";
      model       = "drv:///sample.drv/generic.ppd";
    }
    { name        = "fathoms-kris";
      description = "Canon MF455dw";
      deviceUri   = "socket://10.0.0.216";
      model       = "drv:///sample.drv/generic.ppd";
    }
    { name        = "fathoms-daniela";
      description = "Brother DCP-7065DN";
      deviceUri   = "10.0.0.203";
      model       = "brother-BrGenML1-cups-en.ppd";
    }
    { name        = "fathoms-thermal";
      description = "Zebra ZT230";
      deviceUri   = "socket://10.0.0.214";
      model       = "drv:///sample.drv/zebra.ppd";
      ppdOptions  = {
                      PageSize = "w288h432"; # 4in x 6in
                    };
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
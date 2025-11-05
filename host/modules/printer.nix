{ config, lib, pkgs, ... }:

{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.printing = {
    enable = true;
    #browsed.enable = false; # don't auto-configure printers
    drivers = with pkgs; [
      #cups-filters
      #cups-browsed

      brgenml1lpr
      brgenml1cupswrapper
    ];
  };

  hardware.printers.ensurePrinters = [
    { name        = "fathoms-office";
      description = "Canon MF455dw";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.215";
      model       = "drv:///sample.drv/generic.ppd";
    }
    { name        = "fathoms-kris";
      description = "Canon MF455dw";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.216";
      model       = "drv:///sample.drv/generic.ppd";
    }
    { name        = "fathoms-daniela";
      description = "Brother DCP-7065DN";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.203";
      model       = "brother-BrGenML1-cups-en.ppd";
    }
    { name        = "fathoms-thermal";
      description = "Zebra ZT230";
      location    = "fathoms";
      deviceUri   = "socket://10.0.0.214";
      model       = "drv:///sample.drv/zebra.ppd";
      ppdOptions  = {
                      PageSize = "w288h432"; # 4in x 6in
                    };
    }
  ];
}
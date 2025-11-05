{ config, lib, pkgs, ... }:

{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.printing = {
    enable = true;
    browsed.enable = false; # DO NOT auto-configure printers!
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
      deviceUri   = "socket://10.0.0.203";
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
}
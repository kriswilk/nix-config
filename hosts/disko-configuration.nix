{ lib, cfgDisk, ... }:

{
  disko.devices = {
    disk.main = {
      device = cfgDisk;
      type = "disk";
      content = {
        type = "gpt";
        partitions = {

          ESP = {
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          
          luks = {
            size = "100%";
            content = {
              type = "luks";
              name = "crypt";
              settings.allowDiscards = true;
              content = {
                type = "btrfs";                
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };                  
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "/swap" = {
                    mountpoint = "/swap";
                    swap.swapfile.size = "8G";
                  };
                };                  
              };
            };
          };

        };
      };
    };
  }; 
}
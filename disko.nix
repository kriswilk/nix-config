{ lib, ... }:

{
  disko.devices = {
    disk.primary = {
      # Specify during deployment
      # device = "/dev/XXX OR /dev/disk/by-uuid/<UUID>"
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
              name = "crypted";
              settings.allowDiscards = true;
                
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  
                  "/persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  
                  "/swap" = {
                    mountpoint = "/.swapvol";
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

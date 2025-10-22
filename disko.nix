{ lib, ... }:

{
  disko.devices = {
    nodev = {
      "/" = {
        fsType = "tmpfs";
        mountOptions = [ "size=1G" "mode=0755" ];
      };
    };
    disk.main = {
      # Define this in the host configuration
      # device = "/dev/XXX";
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
                extraArgs = [ "-f" ];
                
                subvolumes = {
                  # "/root" = {
                  #   mountpoint = "/";
                  #   mountOptions = [ "compress=zstd" "noatime" ];
                  # };
                  
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  
                  "/persist" = {
                    mountpoint = "/persist";
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

  fileSystems."/persist".neededForBoot = true;
}
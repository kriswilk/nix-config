{ lib, ... }:

{
  # Use `sudo lsblk` and `sudo blkid` to find the name / UUID of the target disk
  disko.devices.disk.primary.device = "/dev/XXX OR /dev/disk/by-uuid/<UUID>";
}

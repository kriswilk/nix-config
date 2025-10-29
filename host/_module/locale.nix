{ config, lib, pkgs, configName, ... }:

{
  # regional settings
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
}

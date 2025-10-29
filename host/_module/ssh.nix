{ config, lib, pkgs, configName, ... }:

{
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
}

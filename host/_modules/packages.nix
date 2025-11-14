{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    git
    nano
    vim
    wget
  ];
}
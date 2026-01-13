{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    qalculate-qt
  ];
}
{ config, lib, pkgs, ... }:

{
  imports = [
    ../module/gpu_nvidia_open.nix
  ];
}

{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ../.
  ];

  home = {
    username = "guest";
    homeDirectory = "/home/guest";

    packages = with pkgs; [
      # user-specific packages
    ];
  };

  programs = {
    # user-specific programs/options
  };
}
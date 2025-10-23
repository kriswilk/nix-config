{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ../.
  ];

  home = {
    username = "<USERNAME>";
    homeDirectory = "/home/<USERNAME>";

    packages = with pkgs; [
      # user-specific packages
    ];
  };

  programs = {
    # user-specific programs/options
  };
}
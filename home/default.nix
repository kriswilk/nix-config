{ config, lib, pkgs, ... }:

let
  moduleDir = ./_module;
  dirContents = builtins.readDir moduleDir;
  nixFiles = lib.attrNames (
    lib.filterAttrs (name: type: type == "regular" && lib.strings.hasSuffix ".nix" name) dirContents
  );
  modulePaths = builtins.map (name: moduleDir + "/${name}") nixFiles;
in {
  # import all modules
  imports = modulePaths;

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
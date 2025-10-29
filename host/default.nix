{ config, lib, pkgs, configName, ... }:

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

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

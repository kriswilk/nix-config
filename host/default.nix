{ config, lib, pkgs, configName, ... }:

let
  moduleDir = ./_module;
  dirContents = builtins.readDir moduleDir;
  nixFiles = lib.attrNames (
    lib.filterAttrs (name: type: type == "regular" &&
                                 lib.strings.hasSuffix ".nix" name &&
                                 ! (lib.strings.hasPrefix "." name)) dirContents
  );
  modulePaths = builtins.map (name: moduleDir + "/${name}") nixFiles;
in {
  # import all modules
  imports = modulePaths;

  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;

  # WIP: auto garbage collection? updates?

  # system packages
  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

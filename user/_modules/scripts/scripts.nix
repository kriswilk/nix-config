{ config, lib, pkgs, ... }:

let
  isScript = name: type: 
    type == "regular" && lib.strings.hasSuffix ".sh" name;
  
  scriptFiles = lib.filterAttrs isScript (builtins.readDir ./.);

  mkScript = name: _: 
    let
      binName = lib.strings.removeSuffix ".sh" name;
    in
    pkgs.writeShellApplication {
      name = binName;
      # WIP: remove once emoji picker is rewritten without data block after code
      excludeShellChecks = [ "SC2317" ];
      text = builtins.readFile ./${name};
    };

  scriptPackages = lib.mapAttrsToList mkScript scriptFiles;
in
{
  home.packages = scriptPackages;
}
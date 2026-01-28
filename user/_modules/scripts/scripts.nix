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
      text = builtins.readFile ./${name};
    };

  scriptPackages = lib.mapAttrsToList mkScript scriptFiles;

in
{
  # 4. Add the generated list to your home config
  home.packages = scriptPackages;
}
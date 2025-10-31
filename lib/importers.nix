{ lib, ... }:

{
  /*
    Function to import all ".nix" files from a given directory.
    
    @param dir: The path to the folder containing the config files (e.g., ./programs)
    @return: A list of absolute file paths ready for a Nix 'imports' attribute.
  */
  importDirModules = dir:
    let
      files = builtins.readDir dir;
      isNixFile = name: type: type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix";
      nixFileNames = lib.attrNames (lib.filterAttrs isNixFile files);
    in
    map (name: dir + "/${name}") nixFileNames;
}
{ lib, ... }:

let
  # Recursively find and import all .nix files EXCEPT those starting with an underscore
  importAllNixFiles = dir:
    lib.fileset.toList (
      lib.fileset.fileFilter (file: file.hasExt "nix" && ! lib.hasPrefix "_" file.name) dir
    );
in
{
  inherit importAllNixFiles;
}
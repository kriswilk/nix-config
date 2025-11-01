{ config, lib, pkgs, ... }:

{
  imports = lib.fileset.toList (
    lib.fileset.fileFilter (file: file.hasExt "nix" && ! lib.hasPrefix "_" file.name) ./.
  );
}

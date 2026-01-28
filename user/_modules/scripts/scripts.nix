{ config, lib, pkgs, ... }:

let
  # Function to create a package for each script (similar to Method 1)
  myScripts = lib.attrsets.mapAttrsToList
    (name: path: pkgs.writeShellScriptBin name (builtins.readFile path))
    (builtins.readDir ./raw);
in
{
  # Add the directory's contents to the user's PATH
  home.packages = myScripts;

  # Alternatively, if the scripts are already compiled binaries or you have a
  # directory of pre-made scripts and don't want to package them individually
  # you can add the containing directory to the session path.
  # This approach is less "Nix-y" but works.
  # home.sessionPath = [ "/path/to/your/scripts" ]; # Use absolute paths
}
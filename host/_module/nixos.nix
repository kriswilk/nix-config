{ config, lib, pkgs, configName, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [ "flakes" "nix-command" ];  

  nix.optimise = {
    automatic = true;
    dates = [ "03:45" ]; # Optional; allows customizing optimisation schedule
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}

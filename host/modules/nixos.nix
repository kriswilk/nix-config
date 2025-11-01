{ config, lib, pkgs, ... }:

{
  system.stateVersion = "25.05";

  nix.settings.experimental-features = [ "flakes" "nix-command" ];  

  nixpkgs.config.allowUnfree = true;

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
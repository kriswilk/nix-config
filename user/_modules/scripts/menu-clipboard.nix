{ pkgs, ... }:

let
  # --- Option 1: Embedded Script ---
  # 'writeShellApplication' adds dependencies to the PATH specifically for this script.
  embeddedTool = pkgs.writeShellApplication {
    name = "my-embedded-tool";
    
    # Dependencies available ONLY inside this script
    #runtimeInputs = [ pkgs.cowsay pkgs.curl ]; 

    text = ''
      set -euo pipefail

      dmenu="fuzzel --dmenu --minimal-lines"

      cliphist list | $dmenu | cliphist decode | wl-copy
    '';
  };

  # # --- Option 2: External File Reference ---
  # # Reads from an external file, but still checks it and manages dependencies.
  # externalTool = pkgs.writeShellApplication {
  #   name = "my-external-tool";
    
  #   # Add whatever tools your external script needs here
  #   runtimeInputs = [ pkgs.jq pkgs.ripgrep ]; 
    
  #   text = builtins.readFile ./cool-script.sh;
  # };

in
{
  home.packages = [
    embeddedTool
    # externalTool # Uncomment to enable the external script
  ];
}
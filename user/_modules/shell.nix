{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      source $(blesh-share)/ble.sh
    '';
  };

  home.file.".blerc".text = lib.readFile ./ble.sh/.blerc;

  programs.direnv = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = lib.importTOML ./starship/starship.toml;
  };

  # home.packages = with pkgs; [
  #   (blesh.overrideAttrs {
  #     version = "nightly-20251019+2f564e6";
  #     src = fetchzip {
  #       url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly-20251019+2f564e6.tar.xz";
  #       sha256 = "sha256-fpNorzJcKs1vVhaYKgRz5vcs6jsEvdxe3N4F2L81Rc0=";
  #     };
  #   })
  # ];
  home.packages = with pkgs; [
    (blesh.overrideAttrs {
      version = "nightly-20240701+fcbf1ed";
      src = fetchzip {
        url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly-20240701+fcbf1ed.tar.xz";
        sha256 = "";
      };
    })
  ];

  home.shellAliases = {
    # cd
    ".." = "cd ..";

    # ls
    ls = "ls --color=tty";
    ll = "ls -l";
    l = "ls -alh";
  };
}
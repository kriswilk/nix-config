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
      version = "nightly-20241231+3d8f626";
      src = fetchzip {
        url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly-20241231+3d8f626.tar.xz";
        sha256 = "sha256-Xk+QwQ6RDagrf+HgT4OFzgoeQS0N2qnrESx6BwBw4/I=";
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
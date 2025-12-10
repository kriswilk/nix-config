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
  # 611 slim cursor, doesn't work
  # 701 no cursor but works
  home.packages = with pkgs; [
    (blesh.overrideAttrs {
      version = "nightly-20240622+79beebd";
      src = fetchzip {
        url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly-20240622+79beebd.tar.xz";
        sha256 = "sha256-W5Z0lHiBIV2Oc1v/6AkXeYAkOajcwqUwzsoqtZTeds4=";
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
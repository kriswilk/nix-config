{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      source -- ${pkgs.blesh}/share/blesh/ble.sh
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

  home.packages = with pkgs; [
    (blesh.overrideAttrs {
      version = "nightly-20251019+2f564e6";
      src = fetchzip {
        url = "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ ble-nightly-20251019+2f564e6.tar.xz";
        sha256 = "sha256:565e9aa9806d1f2f2362d6293f480d17f0be06623fd8d12945995231933fc428";
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
{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = pkgs.fetchurl {
      url = "https://github.com/kriswilk/themes/raw/refs/heads/main/ekko/base16/ekko-dark.yaml";
      sha256 = lib.fakeSha256;
    };
  };
}
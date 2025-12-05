{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = builtins.fetchurl {
      url = "https://github.com/kriswilk/themes/raw/refs/heads/main/base16/ekko-dark.yaml";
      sha256 = "sha256:0527d5jc4m817pdwkbpm8yz780pggwgylc26qx79akrdnqibnk5g";
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["FiraCode"];};
      name = "FiraCode Nerd Font";
      };
    };
  };
}
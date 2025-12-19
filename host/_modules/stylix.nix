{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    polarity = "light";

    base16Scheme = builtins.fetchurl {
      url = "https://github.com/kriswilk/themes/raw/refs/heads/main/base16/ekko-light.yaml";
      sha256 = "sha256:0fjlqhqgzcba1v8sir4n6hp8qgx7rfi2x2vmsxj97s12d5qlb9r7";
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
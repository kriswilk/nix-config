{ config, lib, pkgs, ... }:

{
  imports = [
    ./_module/archive.nix
    ./_module/audio.nix
    ./_module/browser.nix
    ./_module/cad.nix
    ./_module/development.nix
    ./_module/disk.nix
    ./_module/editor.nix
    ./_module/file-management.nix
    ./_module/font.nix
    ./_module/game.nix
    ./_module/image.nix
    ./_module/network.nix
    ./_module/nixos.nix
    ./_module/office.nix
    ./_module/print-scan.nix
    ./_module/security.nix
    ./_module/shell.nix
    ./_module/system.nix
    ./_module/terminal.nix
    ./_module/text.nix
    ./_module/video.nix
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
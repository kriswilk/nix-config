{ config, lib, pkgs, ... }:

{
  imports = [
    ./module/archive.nix
    ./module/audio.nix
    ./module/browser.nix
    ./module/cad.nix
    ./module/development.nix
    ./module/disk.nix
    ./module/editor.nix
    ./module/file-management.nix
    ./module/font.nix
    ./module/game.nix
    ./module/image.nix
    ./module/network.nix
    ./module/nixos.nix
    ./module/print-scan.nix
    ./module/security.nix
    ./module/shell.nix
    ./module/system.nix
    ./module/terminal.nix
    ./module/text.nix
    ./module/video.nix
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # WIP: need to add or find equiv:

  # ventoy #insecure warning?
  # qbittorrent
  # onedrive, gdrive
  # fineprint
  # renamer
  # segger j-link
  # jdownloader2
}
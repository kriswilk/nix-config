{ config, lib, pkgs, cfgHost, ... }:

{
  imports = [
    ./_module/disko.nix
    ./_module/users.nix
  ];

  # nix / nixpkgs
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;

  # hostname
  networking.hostName = cfgHost;

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # regional settings
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # networking
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
  
  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # printing
  services.printing = {
    enable = true;
    # WIP needs testing/config
  };
  
  # scanning
  hardware.sane.enable = true;
  # WIP needs testing/config

  # ssh
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # desktop environment
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # steam
  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  #   localNetworkGameTransfers.openFirewall = true;
  # };
  # WIP: proton version(s), alternatives?

  # flatpak
  #services.flatpak.enable = true;
  # WIP: need to add flathub repo?
  # WIP: need to use nix-flatpak??

  # WIP: auto garbage collection? updates?

  # system packages
  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];
}

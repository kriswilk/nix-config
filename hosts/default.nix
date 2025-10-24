{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ../disko.nix
  ];

  # nix / nixpkgs
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;

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

  # users
  users.mutableUsers = false;
  users.users.kris = {
    isNormalUser = true;
    description = "Kris Wilk";
    password = "abc123";
    #hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.users.guest = {
    isNormalUser = true;
    description = "Guest User";
    password = "guest";
    extraGroups = [ "networkmanager" ];
  };

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
  # };

  # system packages
  environment.systemPackages = with pkgs; [
    curl
    git
  ];
}

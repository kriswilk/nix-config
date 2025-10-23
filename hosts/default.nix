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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # regional settings
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  
  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  # printing
  services.printing = {
    enable = true;
    # WIP needs testing/config
  };
  
  # scanning
  hardware.sane.enable = true;
  # WIP needs testing/config

  # sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # to use JACK applications, uncomment this
    # jack.enable = true;
  };

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
    #hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" ];
  };

  # ssh
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # steam
  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  # };

  # Delete default shell aliases
  environment.shellAliases = {
    l = null;
    ls = null;
    ll = null;
  };

  # Desktop environment
  #services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    curl
    git
  ];
}

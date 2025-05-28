{ config, pkgs, modulesPath, ... }:

{
  imports = [
    ./disko.nix
  ];

  # Nix / Nixpkgs
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Regional settings
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Networking
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Desktop environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Printing
  services.printing.enable = true;

  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # To use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Users
  users.mutableUsers = false;

  users.users.kris = {
    isNormalUser = true;
    description = "Kris Wilk";
    hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.users.daniela = {
    isNormalUser = true;
    description = "Daniela Wilk";
    hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" ];
  };
  users.users.hugo = {
    isNormalUser = true;
    description = "Hugo Wilk";
    hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" ];
  };
  users.users.any = {
    isNormalUser = true;
    description = "Any Wilk";
    hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" ];
  };
  users.users.les = {
    isNormalUser = true;
    description = "Les Wilk";
    hashedPassword = "$6$gAiyBIv4.mq.cj7M$igjNOI.yUsGGR5LWISkq3Zo34dDfFwKRkBKqP0cxpkP6kvSSF8RyKGIwEztYLdkbinpDBcmKCp24.VhEv0zRK0";
    extraGroups = [ "networkmanager" ];
  };

  # SSH
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # Firefox
  programs.firefox.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    curl
    git
  ];
}

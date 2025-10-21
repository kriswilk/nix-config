{ config, pkgs, modulesPath, ... }:

{
  imports = [
    ../disko.nix
  ];

  # Nix / Nixpkgs
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Regional settings
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  # Networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  
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

  # SSH
  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    curl
    git
  ];
}

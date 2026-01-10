{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session --time --width 40 --window-padding 2 --container-padding 4 --greeting 'Welcome to NixOS!' --asterisks --theme 'container=black;border=blue;title=yellow;greet=white;text=gray;prompt=green;input=gray;time=white;action=blue;button=yellow'";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  # systemd.services.greetd.serviceConfig = {
  #   Type = "idle";
  #   StandardInput = "tty";
  #   StandardOutput = "tty";
  #   StandardError = "journal"; # Without this errors will spam on screen
  #   # Without these bootlogs will spam on screen
  #   TTYReset = true;
  #   TTYVHangup = true;
  #   TTYVTDisallocate = true;
  # };




  # services.displayManager.ly = {
  #   enable = true;
  #   settings = {
  #     animation = "matrix";
  #     #hide_key_hints = true;
  #     #hide_version_string = true;
  #     input_len = 24;
  #     text_in_center = true;
  #     clear_password = true;
  #     save = true;
  #   };
  # };

  # services.displayManager.dms-greeter = {
  #   enable = true;
  #   compositor.name = "niri";
  # };

  # WIP: to be replaced by niri or hyprland?
  #services.desktopManager.plasma6.enable = true;

  # WIP: Niri needs a lot more configuration to be usable...
  programs.niri.enable = true;
  programs.dms-shell.enable = true;
  
  environment.systemPackages = with pkgs; [
    #noctalia-shell
    #fuzzel
    #mako
    #swayidle
    #swaylock
    xwayland-satellite
    #waybar

    qalculate-qt
  ];
}
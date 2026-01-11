{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
          --cmd niri-session \
          --time --time-format '%a, %b %d %Y • %T' \
          --width 50 --window-padding 1 --container-padding 2 \
          --theme 'container=black;border=blue;title=yellow;greet=blue;text=gray;prompt=White;input=gray;time=white;action=blue;button=yellow' \
          --asterisks \
        '';
        user = "greeter";
      };
    };
  };

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
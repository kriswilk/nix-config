{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # fonts
    # onedrive, gdrive
    # fineprint
    # renamer
    # flatpak?
    # segger j-link
    # jdownloader2
    # rufus
    # crystaldiskinfo
    # crystaldiskmark

    # misc
    kdePackages.krunner # already installed?
    kdePackages.kalk # already installed?
    kdePackages.kcalc # already installed?

    # suites
    libreoffice

    # disk / file
    kdePackages.ark # already installed?
    kdePackages.filelight # already installed?
    kdePackages.k3b # already installed?
    krename # anything better?
    bcompare
    ventoy
    qbittorrent

    # audio
    audacity

    # video
    vlc
    ffmpeg
    handbrake
    mkvtoolnix
    stremio

    # photo / illustration
    gimp3
    inkscape
    krita

    # 3d / cad
    blender
    freecad
    kicad
    prusa-slicer

    # text
    kdePackages.kate # already installed?
    kdePackages.okular # already installed?
    calibre
    koreader

    # print / scan
    naps2

    # programming
    vscode-fhs
    #vscode
    imhex

    # networking
    tailscale
    wireshark
    angryipscanner
    kdePackages.krdc # already installed?

    # storage
    rclone

    # gaming
    jdk
    prismlauncher

    # cli
    neofetch








    nnn # a fast and lightweight terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  programs.direnv = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.pandoc = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
}
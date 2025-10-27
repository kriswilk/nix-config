{ config, lib, pkgs, ... }:

{
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  home.shellAliases = {
    # cd
    ".." = "cd ..";

    # ls
    ls = "ls --color=tty";
    ll = "ls -l";
    l = "ls -alh";
  };

  programs = {
    # shell
    bash.enable = true;
    direnv.enable = true;
    starship.enable = true;

    # monitoring
    btop.enable = true;
    fastfetch.enable = true;

    # file management
    yazi.enable = true;
      # dependencies / helpers...
      #nerd-fonts (recommended)
      #ffmpeg # video thumbnails
      #7-Zip # archive extraction and preview, requires non-standalone version
      jq.enable = true; # JSON preview
      #poppler # PDF preview
      fd.enable = true; # file search
      ripgrep.enable = true; # file content searching
      fzf.enable = true; # quick file subtree navigation, >= 0.53.0
      zoxide.enable = true; # historical directories navigation
      #resvg # SVG preview
      #ImageMagick # Font, HEIC, and JPEG XL preview, >= 7.1.1
      #xclip / wl-clipboard / xsel # Linux clipboard support

    # text
    neovim.enable = true;
    pandoc.enable = true;

    # terminal
    # alacritty = {
    #   enable = true;
    #   # custom settings
    #   settings = {
    #     env.TERM = "xterm-256color";
    #     font = {
    #       size = 12;
    #       draw_bold_text_with_bright_colors = true;
    #     };
    #     scrolling.multiplier = 5;
    #     selection.save_to_clipboard = true;
    #   };
    # };

    # browser
    # firefox.enable = true;

    # OTHER UNSORTED TOOLS
    # yq-go # yaml processor https://github.com/mikefarah/yq
    # eza # A modern replacement for ‘ls’
  };

  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    jetbrains-mono
    #fira-code
    nerd-fonts.jetbrains-mono
    #nerd-fonts.fira-code
    # fonts
    # onedrive, gdrive
    # fineprint
    # renamer
    # flatpak?
    # segger j-link
    # jdownloader2
    # rufus

    # basic
    file
    tree

    # misc
    #kdePackages.krunner # already installed?
    #kdePackages.kalk # already installed?
    #kdePackages.kcalc # already installed?

    # suites
    #libreoffice

    # disk / file
    #kdePackages.ark # already installed?
    #kdePackages.filelight # already installed?
    #kdePackages.k3b # already installed?
    #krename # anything better?
    #bcompare
    #ventoy #insecure warning?
    #qbittorrent

    # audio
    #audacity

    # video
    #vlc
    #ffmpeg
    #handbrake
    #mkvtoolnix
    #stremio

    # photo / illustration
    #gimp3
    #inkscape
    #krita

    # 3d / cad
    #blender
    #freecad
    #kicad
    #prusa-slicer

    # text
    nano
    #kdePackages.kate # already installed?
    #kdePackages.okular # already installed?
    #calibre
    #koreader

    # print / scan
    #naps2

    # programming
    #vscode-fhs
    #vscode
    #imhex

    # networking
    dnsutils # dig, nslookup, ...
    #tailscale
    #wireshark
    #angryipscanner
    #kdePackages.krdc # already installed?

    # storage
    rclone

    # gaming
    #jdk
    #prismlauncher

    # development
    gnumake
    gcc

    # archives
    zip
    unzip
    p7zip

    # benchmarking / testing
    fio # disk performance
    iperf3 # network performance
    
    # monitoring
    smartmontools # disk health
    sysstat # system performance
    lm_sensors # sensors
    ethtool # ethernet
    pciutils # pci
    usbutils # usb
    strace # system calls
    ltrace # library calls
    lsof # open files

    # security
    gnupg

    # UNSORTED ITEMS FROM OTHER FLAKES

    # # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
  ];
}
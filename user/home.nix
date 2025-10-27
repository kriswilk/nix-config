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

  fonts.fontconfig.enable = true;

  programs = {
    # shell
    bash.enable = true;
    direnv.enable = true;
    starship.enable = true;

    # monitoring
    btop.enable = true;
    fastfetch.enable = true;

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

  # file manager (w/ deps)
  programs.yazi.enable = true;
  #nerd-fonts (recommended)
  programs.jq.enable = true; # JSON preview
  programs.fd.enable = true; # file search
  programs.ripgrep.enable = true; # file content searching
  programs.fzf.enable = true; # quick file subtree navigation, >= 0.53.0
  programs.zoxide.enable = true; # historical directories navigation
  #xclip / wl-clipboard / xsel # Linux clipboard support

  home.packages = with pkgs; [
    ffmpeg p7zip poppler jq fd ripgrep fzf zoxide resvg imagemagick file

    # fonts
    nerd-fonts.jetbrains-mono

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
    iperf33 # network performance
    
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
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing


    # onedrive, gdrive
    # fineprint
    # renamer
    # segger j-link
    # jdownloader2
  ];
}
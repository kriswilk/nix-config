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
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
    pandoc.enable = true;

    # file management
    yazi.enable = true; # terminal file manager
    fd.enable = true; # 'find' alternative
    ripgrep.enable = true; # recursive content searching
    fzf.enable = true; # fuzzy finder
    zoxide.enable = true; # 'cd' alternative
    #xclip / wl-clipboard / xsel # Linux clipboard support

    # text / pdf / document
    jq.enable = true; # json processor

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

    # development
    git.enable = true;

    # OTHER UNSORTED TOOLS
    # yq-go # yaml processor https://github.com/mikefarah/yq
    # eza # A modern replacement for ‘ls’
  };

  home.packages = with pkgs; [
    # font
    nerd-fonts.jetbrains-mono

    # file management
    file # display file type
    tree # visualize directory structure
    #
    #kdePackages.ark # already installed?
    #kdePackages.filelight # already installed?
    #kdePackages.k3b # already installed?
    #krename # anything better?
    #bcompare

    # misc
    #kdePackages.krunner # already installed?
    #kdePackages.kalk # already installed?
    #kdePackages.kcalc # already installed?

    # suite
    #libreoffice

    # audio
    #audacity

    # video
    ffmpeg # video processing
    #mkvtoolnix
    #handbrake
    #
    #stremio
    #vlc

    # photo / illustration
    imagemagick # image processing
    resvg # svg rendering
    #
    #gimp3
    #inkscape
    #krita

    # 3d / cad
    #blender
    #freecad
    #kicad
    #prusa-slicer

    # text / pdf / document
    nano # editor
    gnugrep # grep
    gnused # sed
    gawk # awk
    poppler # pdf tools
    #
    #kdePackages.kate # already installed?
    #kdePackages.okular # already installed?
    #calibre
    #koreader

    # print / scan
    #naps2

    # network
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
    #
    #vscode-fhs
    #vscode
    #imhex

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
    gnupg # gpg

    # misc
    #ventoy #insecure warning?
    #qbittorrent


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
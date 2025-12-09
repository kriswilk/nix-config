{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
  };

  programs.gh = {
    enable = true;
  };

  programs.vscode = {
    # WIP: use FHS version instead?
    # WIP: enable = true;

    # extensions = with pkgs.vscode-extensions; [
    #   ms-python.python
    #   ms-vscode.cpptools
    #   ms-azuretools.vscode-docker
    #   eamodio.gitlens
    #   ms-vscode-remote.remote-ssh
    #   ms-vscode-remote.remote-ssh-edit
    #   ms-vscode-remote.remote-wsl
    #   ms-vscode-remote.vscode-remote-extensionpack
    # ];
  };

  home.packages = with pkgs; [
    gcc
    gnumake
    nixfmt-rfc-style
    # WIP: j-link
  ];
}

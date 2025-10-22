#!/usr/bin/env nix-shell
#!nix-shell -i bash --packages bash disko

read -p "Enter hostname: " hostname

# prepare disk
sudo disko --mode destroy,format,mount --flake github:kriswilk/nix-config#${hostname}

# install
sudo nixos-install --no-channel-copy --no-root-password --flake github:kriswilk/nix-config#${hostname}

# clone repo for future use
sudo git clone https://github.com/kriswilk/nix-config /mnt/etc/nixos
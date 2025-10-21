# nix-config

NixOS system & user configuration, based on Flakes and Home-Manager.

## Usage

1. Boot from a NixOS USB drive.
2. Clone this repo:

```
git clone https://github.com/kriswilk/nix-config
cd nix-config
```

3. Prepare the disk with `disko`:

```
nix-shell -p disko
sudo nixos-generate-config --no-filesystems --show-hardware-config > hardware-configuration.nix
sudo disko --mode destroy,format,mount --flake .#<name>
```

4. Copy the configuration to the new filesystem
# WIP
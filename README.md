# nix-config

NixOS system & user configuration based on flakes and home-manager.

## Usage

1. Boot from a NixOS live CD/USB.
2. If the host is new, generate `hardware-configuration.nix` and add it to the repo:

```
sudo nixos-generate-config --no-filesystems --show-hardware-config > hardware-configuration.nix
```

3. Run the `install.sh` script:

```
curl https://github.com/kriswilk/nix-config/raw/refs/heads/main/install.sh | bash
```
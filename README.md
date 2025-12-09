# nix-config

NixOS system & user configuration based on flakes and home-manager.

## Usage

After booting from a NixOS live CD/USB, run:

```
nix-shell -p disko
bash <(curl -Ls https://github.com/kriswilk/nix-config/raw/refs/heads/main/install.sh)
```
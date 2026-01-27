#!/usr/bin/env bash
set -euo pipefail

dmenu="fuzzel -d"

cliphist list | $dmenu | cliphist decode | wl-copy
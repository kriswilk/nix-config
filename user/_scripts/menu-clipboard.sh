#!/usr/bin/env bash
set -euo pipefail

dmenu="fuzzel -d"

item="$(cliphist list | $dmenu)"

if [ -z "$item" ]; then
    echo "$item" | cliphist decode | wl-copy
fi
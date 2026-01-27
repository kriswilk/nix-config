#!/usr/bin/env bash
set -euo pipefail

dmenu="fuzzel -d --minimal-lines"

item="$(cliphist list | $dmenu)"

if [ -n "$item" ]; then
    echo "$item" | cliphist decode | wl-copy
fi
#!/usr/bin/env bash
set -euo pipefail

list="$(cliphist list)"
dmenu="fuzzel --dmenu --minimal-lines"

item="$(printf "$list" | $dmenu)"

case "$item" in
    "!wipe")
        cliphist wipe
        ;;
    *)
        echo "$item" | cliphist decode | wl-copy
        ;;
esac

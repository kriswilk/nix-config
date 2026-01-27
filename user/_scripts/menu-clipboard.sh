#!/usr/bin/env bash
set -euo pipefail

dmenu="fuzzel -d --minimal-lines"

item="$(cliphist list | $dmenu)"

[ -z "$item" ] && exit 123

case "$item" in
    wipe)
        cliphist wipe
        ;;
    *)
        echo "$item" | cliphist decode | wl-copy
        ;;
esac
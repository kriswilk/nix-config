#!/usr/bin/env bash

echo -e "y\nn" | fuzzel --dmenu \
                        --prompt "Confirm: " \
                        --placeholder "y/n" \
                        --auto-select \
                        --width 30 \
                        --lines 0
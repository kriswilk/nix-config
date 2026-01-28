#!/usr/bin/env bash

echo -e "Y\nN" | fuzzel --dmenu \
                        --prompt-only "Confirm (Y/N): " \
                        --placeholder "" \
                        --auto-select \
                        --width 20
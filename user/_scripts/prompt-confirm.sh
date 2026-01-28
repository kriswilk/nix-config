#!/usr/bin/env bash

echo -e "Y\nN" | fuzzel --dmenu \
                        --placeholder "" \
                        --auto-select \
                        --width 30
#!/bin/sh

CHOICES="   Lock\n 󰤄  Suspend\n 󰜎  Log Out\n   Reboot\n   Shutdown"
DMENU="fuzzel --dmenu -l 5 -w 13 --line-height 45 --vertical-pad 20 --hide-prompt -f monospace:size=20"

SELECTION="$(printf "$CHOICES" | $DMENU)"

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		systemctl suspend;;
	*"Log Out")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac

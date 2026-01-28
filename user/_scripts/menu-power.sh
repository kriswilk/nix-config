#!/usr/bin/env bash

list="   Lock\n 󰤄  Suspend\n 󰜎  Log Out\n   Reboot\n   Shutdown"
dmenu="fuzzel --dmenu -l 5 -w 13 --line-height 45 --vertical-pad 20 --hide-prompt -f monospace:size=20"

action="$(echo -e "$list" | $dmenu)"

case $action in
	*"Lock")
		swaylock
		;;
	*"Suspend")
		systemctl suspend
		;;
	*"Log Out")
		niri msg action quit
		;;
	*"Reboot")
		systemctl reboot
		;;
	*"Shutdown")
		systemctl poweroff
		;;
esac
#!/bin/bash

SELECTION="$(printf " Lock\n󰤄 Suspend\n󰗽 Log Out\n Reboot\n Shutdown" | fuzzel --dmenu -l 5 -w 13 --placeholder "Power Menu" -f "monospace:size=20")"

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

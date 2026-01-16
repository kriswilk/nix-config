#!/bin/bash

SELECTION="$(printf " Lock\n󰤄 Suspend\n󰗽 Log Out\n Reboot\n Shutdown" | fuzzel --dmenu -l 5 -w 13 --placeholder "Power Menu" -f "monospace:size=20")"

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		sudo systemctl suspend;;
	*"Log Out")
		niri msg action quit;;
	*"Reboot")
		sudo systemctl reboot;;
	*"Shutdown")
		sudo systemctl poweroff;;
esac

#!/bin/bash

SELECTION="$(printf " Lock\n󰤄 Suspend\n󰗽 Log Out\n Reboot\n Shutdown" | fuzzel --dmenu -l 6 -p "Power Menu: ")"

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		sudo systemctl suspend;;
	*"Log Out")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	*"Shutdown")
		systemctl poweroff;;
esac

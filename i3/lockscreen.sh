#!/bin/bash

# Requirements: http://www.fmwconcepts.com/imagemagick/videoglitch/index.php
#		Imagemagick

scrot /tmp/screen.png
$HOME/scripts/image/videoglitch -n 20 -j 10 -c green-magenta /tmp/screen.png /tmp/screen.png
if [[ -f $HOME/.config/lock.png ]]
then
	echo "Doing it"
	PX=0
	PY=0
	R=$(file ~/.config/lock.png | grep -o '[0-9]* x [0-9]*')
	RX=$(echo $R | cut -d' ' -f 1)
	RY=$(echo $R | cut -d' ' -f 3)

	SR=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
	for RES in $SR
	do
		SRX=$(echo $RES | cut -d'x' -f 1)
		SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)
		SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2)
		SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3)
		PX=$(($SROX + $SRX/2 - $RX/2))
		PY=$(($SROY + $SRY/2 - $RY/2))

		convert /tmp/screen.png $HOME/.config/lock.png -geometry +$PX+$PY -composite -matte /tmp/screen.png
	done
fi
i3lock -e -u -n -i /tmp/screen.png

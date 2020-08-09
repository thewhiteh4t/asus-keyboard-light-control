#!/bin/bash

usage="
Asus Keyboard Brightness Control
================================

Usage :
	Increase : ./asus_kbd_light.sh up
	Decrease : ./asus_kbd_light.sh down
	Maximum  : 3
	Minimum  : 0
"    
user_inp=$1
if [[ $user_inp != "up"  ]] && [[ $user_inp != "down"  ]]
then
	echo "$usage"
else
	:
fi

file_path=/sys/class/leds/asus::kbd_backlight/brightness
current=$(cat $file_path)

if [[ $user_inp == up ]] && [[ $current != 3 ]]
then
	new_b=$(($current + 1))
	echo $new_b > $file_path
elif [[ $user_inp == down  ]] && [[ $current != 0 ]]
then
	new_b=$(($current - 1))
	echo $new_b > $file_path
else
	:
fi

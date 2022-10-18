#!/usr/bin/env bash

## Author : Adrian Binkley
#
## Rofi   : Brightness Menu

# Current Theme
dir="$HOME/.config/rofi/"
theme='brightness-style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
increase='+'
decrease='-'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$decrease\n$increase" | rofi_cmd
}

# Actions
# case ${chosen} in
# 	$increase)
# 	    	brightnessctl s +5%
#        	;;
# 	$decrease)
#     		brightnessctl s 5%-
#        	;;
# esac

while true
do
	chosen="$(run_rofi)"
	if [[ "$chosen" == "$increase" ]]; then
		brightnessctl s +5%
	elif [[ "$chosen" == "$decrease" ]]; then
		brightnessctl s 5%-
	else
		exit 0
	fi	
done
# Call script again until desired brightness reached

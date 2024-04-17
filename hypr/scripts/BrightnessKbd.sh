#!/bin/bash
#

get_kbd_backlight() {
	echo $(brightnessctl -d 'kbd_backlight' -m | cut -d, -f4)
}

# Change brightness
change_kbd_backlight() {
	brightnessctl -d kbd_backlight set "$1"
}

# Execute accordingly
case "$1" in
"--get")
	get_kbd_backlight
	;;
"--inc")
	change_kbd_backlight "+5%"
	;;
"--dec")
	change_kbd_backlight "5%-"
	;;
*)
	get_kbd_backlight
	;;
esac
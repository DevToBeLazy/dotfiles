#!/bin/bash

local backlight_percent=$(brightnessctl -m | cut -d, -f4)
local backlight_value=${backlight_percent%\%}

if [ $backlight_value -le 25 ]; then
	brightnessctl -d $(ls -w1 /sys/class/backlight | head -1) set 25%
else
	brightnessctl -d $(ls -w1 /sys/class/backlight | head -1) set "$1"
fi

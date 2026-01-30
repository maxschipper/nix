#!/usr/bin/env sh

STATUS=$(brightnessctl g -d "platform::kbd_backlight")

if [ $STATUS -ge 1 ]; then

  brightnessctl s 0 -d "platform::kbd_backlight"

else

  brightnessctl s 1 -d "platform::kbd_backlight"

fi

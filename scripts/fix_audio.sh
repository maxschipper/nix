#! /usr/bin/env sh

# run this after startup or add it to your wm config
# hyprland.conf: exec-once = .../fix_audio.sh

# sleep 4

amixer -c 1 set Master unmute
amixer -c 1 set Speaker unmute

wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 0%

notify-send -e -t 2 "Done" "Finished fix-audio script"

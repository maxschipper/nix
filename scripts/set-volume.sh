#! /usr/bin/env sh

wpctl set-volume @DEFAULT_AUDIO_SINK@ 15%
wpctl set-mute @DEFAULT_AUDIO_SINK@ 0

notify-send -e -t 2000 "Volume" "Set to 15%"

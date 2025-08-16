#! /usr/bin/env sh

# run this after startup or add it to your wm config
# hyprland.conf: exec-once = .../fix_audio.sh

pactl set-card-profile alsa_card.pci-0000_04_00.6 output:analog-stereo
sleep 1
pactl set-card-profile alsa_card.pci-0000_04_00.6 pro-audio

#!/usr/bin/env bash

pidof quickshell || caelestia-shell &
# caelestia-shell &

pidof tailscale || tailscale systray

sleep 1 && notify-send "Quickshell" "started successfully"

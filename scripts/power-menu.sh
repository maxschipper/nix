#!/usr/bin/env bash
result=$(echo -e "Lock\nShutdown\nReboot\nSuspend\nHibernate\nLog out" | fuzzel --dmenu --placeholder="POWER MENU" --hide-prompt -l 6)

if [[ "${result}" = "Lock" ]]; then
  niri msg action power-off-monitors && loginctl lock-session
elif [[ "${result}" = "Shutdown" ]]; then
  systemctl poweroff -i
elif [[ "${result}" = "Suspend" ]]; then
  systemctl suspend
elif [[ "${result}" = "Hibernate" ]]; then
  systemctl hibernate
elif [[ "${result}" = "Reboot" ]]; then
  systemctl reboot
elif [[ "${result}" = "Log out" ]]; then
  loginctl terminate-user $USER
fi

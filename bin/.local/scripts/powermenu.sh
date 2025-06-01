#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nLock\nLogout\nSuspend" | rofi -dmenu -i -p "Power")

case "$choice" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Lock) i3lock ;;
  Logout) i3-msg exit ;;
  Suspend) systemctl suspend ;;
esac

#!/bin/bash

THRESHOLD=18

function test {
  acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
    read -r status capacity
    if [ "$status" = "Discharging" -a "$capacity" -lt "$THRESHOLD" ]; then
      logger "Critical battery threshold reached: hibernating."
      notify-send -u critical "Critical battery threshold reached: hibernating." -i "battery" -a "lowbat.sh"
      systemctl hibernate
    fi
  }
}

while :; do
  test
  sleep 30
done

#!/usr/bin/env bash
# ##########################################
# a shell script to connect to my hotspot
# ##########################################

# scan for wifis first
# avaiable=$(nmcli dev wifi list)
avaiable=$(nmcli -f SSID dev wifi | tail -n +2)

# vars
pep="pep"
school="WLAN-HTLW"
home="SIGMA"

# get currend ssid
ssid=$(nmcli -t -f active,ssid dev wifi | grep "yes" | cut -d: -f 2)

if [ "$ssid" = "$pep" ]; then
  if [[ -z $("$avaiable" | grep "$school") ]]; then # when no value
    nmcli dev wifi con "$home"
    echo "$home"
  else
    nmcli dev wifi con "$school"
    echo "$school"
  fi
else
  nmcli dev wifi con "$pep"
  echo "$pep"
fi

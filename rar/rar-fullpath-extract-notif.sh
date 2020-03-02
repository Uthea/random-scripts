#!/bin/bash
#this script requires rar and notify-send and used in thunar as custom action
#this script will leave 1 tail process in the background (also nohup.out in current folder)

killall -q tail
nohup rar x "$1" &
tail -f nohup.out | while read line; do echo "$line" | grep -q -E "Extracting from |Total errors|All OK" && notify-send "Extracting RAR" "$line" -t 0 -h string:x-canonical-private-synchronous:my-notification; done   



#!/bin/bash
zathura "$1"
sleep 0.5
osascript -e 'tell application "System Events" to set frontmost of process "zathura" to true'

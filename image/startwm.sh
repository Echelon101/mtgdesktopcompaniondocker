#!/bin/bash
/usr/bin/pulseaudio --start


# Need to have a UTF-8 friendly LANG set.

export LANG=en_US.UTF-8

xfce4-terminal --command /mtg-desktop-companion/bin/mtg-desktop-companion.sh &

# create desktop shortcut 
mkdir -p /config/Desktop

# This blocks until user closes session
/usr/bin/startxfce4 > /dev/null 2>&1
#!/bin/bash

# Variables
export QT_QPA_PLATFORMTHEME="qt5c"
export QT_STYLE_OVERRIDE="gtk2"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERMINAL="urxvtc"
export BROWSER="chromium"

export FREETYPE_PROPERTIES="truetype:interpreter-version=40"

# Autostart
# Ctrl + Alt + backspace to kill the X server
setxkbmap -option terminate:ctrl_alt_bksp
# Swap escape and caps lock
setxkbmap -option caps:swapescape

xset r rate 150 50
xset m 0 0
xset +dpms
xset dpms 0 0 60
$HOME/bin/lvds

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
#pasystray &
trackpoint &
redshift-gtk &
thunar --daemon &
urxvtd &
#xfce4-volumed-pulse &>/dev/null &
#compton -b

#!/bin/bash

# Variables
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERMINAL="urxvtc"
export BROWSER="chromium"

export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.opengl=true"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export JAVA_FONTS="/usr/share/fonts/ttf"
export CALIBRE_USE_SYSTEM_THEME=1

# Ctrl + Alt + backspace to kill the X server
setxkbmap -option terminate:ctrl_alt_bksp

# Autostart
keyboard
trackpoint &
xhost -
xset m 0 0
#xinput --set-prop 12 "libinput Accel Speed" 0.7
xset +dpms
xset dpms 0 0 180
if xrandr --query | grep "HDMI2 connected" &>/dev/null; then dvi; else lvds; fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
pasystray &
redshift-gtk &
Thunar --daemon &
urxvtd -f -q -o
mconnect &

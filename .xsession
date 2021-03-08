#!/bin/bash

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERMINAL="alacritty"
export BROWSER="chromium"

export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
export JAVA_FONTS="/usr/share/fonts/ttf"
export CALIBRE_USE_SYSTEM_THEME=1
export WINIT_HIDPI_FACTOR=1

# Ctrl + Alt + backspace to kill the X server
setxkbmap -option terminate:ctrl_alt_bksp
#feh --no-fehbg --bg-scale "$HOME/.background.jpg"
xsetroot -solid "#171717"
keyboard &
xhost -
xset +dpms
xset dpms 0 0 180
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
Thunar --daemon &
nm-applet &
pasystray &
redshift-gtk &
xfce4-clipman &
menutray -gtk3 -i &
picom -b

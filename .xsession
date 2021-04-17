#!/bin/bash
export TERMINAL="alacritty"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
export JAVA_FONTS="/usr/share/fonts/ttf"
export WINIT_HIDPI_FACTOR=1
export MOZ_WEBRENDER=1 MOZ_X11_EGL=1
xhost -
xset +dpms
xset dpms 0 0 180
# Ctrl + Alt + backspace to kill the X server
setxkbmap -option terminate:ctrl_alt_bksp
#feh --no-fehbg --bg-scale "$HOME/.background.jpg"
xsetroot -solid "#171717"
# keyboard
setxkbmap -option caps:swapescape
#setxkbmap -option altwin:swap_alt_win
xset r rate 120 70
xset r rate 140 55
# startup apps
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
Thunar --daemon &
nm-applet &
pasystray &
redshift-gtk &
xfce4-clipman &
menutray -gtk3 -i &
picom -b

#!/bin/bash

# Variables
export QT_QPA_PLATFORMTHEME=qt5c
export QT_STYLE_OVERRIDE=gtk2
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERMINAL="urxvtc"
export BROWSER="chromium"
#FT2_SUBPIXEL_HINTING=0  # Classic mode (default in 2.6)
FT2_SUBPIXEL_HINTING=1  # Infinality mode
#FT2_SUBPIXEL_HINTING=2  # Minimal mode (default in 2.7)


# Autostart
# Ctrl + Alt + backspace to kill the X server
setxkbmap -option terminate:ctrl_alt_bksp
# Swap escape and caps lock
setxkbmap -option caps:swapescape

#sed -i -e '/Icon=/c\Icon=telegram' .local/share/applications/telegramdesktop.desktop

#!/bin/sh
#
# ~/xinitrc
#
# Executed by startx (run your window manager from here)
#

# Run system shell scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
 	unset f
fi

# Run user xsession shell script
script="$HOME/.xsession"
if [ -x "$script" -a ! -d "$script" ]; then
    . "$script"
fi

if [ -s ~/.Xresources ]; then
    xrdb ~/.Xresources
fi

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

function i3 {
	#feh --no-fehbg --bg-scale "$HOME/.background.jpg"
	exec dbus-launch /usr/bin/i3 > ~/.local/share/xorg/i3.log
}

function bspwm {
	exec bspwm
}

function xfce {
	exec dbus-launch startxfce4
}

function twm {
	twm &
	xclock -geometry 50x50-1+1 &
	xterm -geometry 80x50+494+51 &
	xterm -geometry 80x20+494-0 &
	exec xterm -geometry 80x66+0+0 -name login
}

default=i3
session=${1:-$default}
export XSESSION=$session
case $session in
	twm			) twm;;
    i3			) i3;;
    xfce|xfce4	) xfce;;
    # No known session, try to run it as command
    *) exec $1;;
esac

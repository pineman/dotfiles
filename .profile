export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/proj/go"

export PATH="/usr/lib/ccache/bin:$HOME/code/bin:$PATH:/opt/microchip/xc16/v1.33/bin:$GOPATH/bin"

export PAGER="vimpager"

eval $(dircolors ~/.dircolors)

redshift -m drm -o
setterm --powerdown 60
setterm --powersave on
setterm --regtabs 4
setterm --blength 0

TERM=linux setterm -regtabs 4 # always set tabstop to 4

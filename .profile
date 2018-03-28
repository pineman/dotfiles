export EDITOR="vim"
export PAGER="vimpager"
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/proj/go"

export PATH="/usr/lib/ccache/bin:$HOME/code/bin:$PATH:/opt/microchip/xc16/v1.33/bin:$GOPATH/bin"

eval $(dircolors ~/.dircolors)

redshift -m drm -o
setterm --powerdown 2
setterm --blength 0

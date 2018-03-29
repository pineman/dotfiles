export EDITOR="vim"
command -v vimpager &>/dev/null && export PAGER="vimpager"
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/proj/go"

export PATH="$HOME/code/bin:$PATH:$GOPATH/bin"
export PATH="/usr/lib/ccache/bin:$PATH:/opt/microchip/xc16/v1.33/bin"

eval $(dircolors ~/.dircolors)

redshift -m drm -o

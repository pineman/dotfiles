export EDITOR="vim"
if [ $(command -v vimpager) ]; then export PAGER="vimpager"; fi
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/proj/go"

export PATH="$HOME/code/bin:$PATH:$GOPATH/bin"
export PATH="/usr/lib/ccache/bin:$PATH"

eval $(dircolors ~/.dircolors)

if [ $(command -v redshift) ]; then redshift -m drm -o; fi

#
# ~/.bash_profile
#
export PATH="/usr/lib/ccache/bin:$HOME/code/bin:$PATH:/opt/microchip/xc16/v1.33/bin"

export HISTSIZE=1000000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL="erasedups:ignoreboth"
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

export EDITOR="vim"
export XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="$HOME/proj/go"
export PYTHONSTARTUP="$HOME/.pythonrc"

export PAGER="vimpager"

eval $(dircolors ~/.dircolors)

if [ "$TERM" == "linux" ]; then
	redshift -m drm -o
	setterm --powerdown 60
	setterm --powersave on
	setterm --regtabs 4
	setterm --blength 0
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

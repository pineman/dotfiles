#
# ~/.bash_profile
#

export PATH=$HOME/code/bin:$PATH

export HISTSIZE=1000000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL="erasedups:ignoreboth"
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"


export EDITOR="vim"
export GOPATH="$HOME/proj/go"
export PYTHONSTARTUP="$HOME/.pythonrc"

[ -f $HOME/.vim/bundle/vimpager/vimpager ] &>/dev/null && \
	export PAGER="$HOME/.vim/bundle/vimpager/vimpager"

if [ "$TERM" == "linux" ]; then
	redshift -m drm -o
	setterm --powerdown 60
	setterm --powersave on
	setterm --regtabs 4
	setterm --blength 0
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

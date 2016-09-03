# .bashrc
eval $(dircolors ~/.dircolors)

complete -cf sudo
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dirspell
shopt -s dotglob
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob
set -o vi
bind -x $'"\C-l":clear;'
bind -x $'"\C-r":reset;'
#compopt -o bashdefault ls

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

orange='\[\e[38;5;166m\]'
baseblue='\[\e[38;5;4m\]'
white='\[\e[38;5;7m\]'
green='\[\e[38;5;2m\]'
yellow='\[\e[38;5;3m\]'
blue='\[\e[38;5;27m\]'
red='\[\e[38;5;1m\]'
myred='\[\e[38;5;9m\]'
grey='\[\e[38;5;10m\]'
reset='\[\e[0m\]'
underline=`tput smul`
bold=`tput bold`
toshiba='\[\e[38;5;14m\]'
hackmobile='\[\e[38;5;4m\]'
oceanical='\[\e[38;5;27m\]'
aquaris='\[\e[38;5;155m\]'
minileet='\[\e[38;5;10m\]'
pinecone='\[\e[38;5;94m\]'

set_prompt () {
	PS1="[$grey\u$reset@$red\h$reset] "
	PS1+="- [$yellow$(date +"%H:%M:%S %d/%m/%Y")$reset] "
	PS1+="\n$white\$?$reset [$red\w$reset] $ "
}

PROMPT_COMMAND='set_prompt && echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

TERM=linux setterm -regtabs 4 # always set tabstop to 4

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

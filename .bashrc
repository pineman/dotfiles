# .bashrc
set -o vi
complete -cf sudo
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s histappend
shopt -s hostcomplete

bind -x $'"\C-l":clear;'
bind -x $'"\C-r":reset;'
bind -x '"\C-x"':"fg"

white='\[\e[38;5;15m\]'
yellow='\[\e[38;5;3m\]'
grey='\[\e[38;5;10m\]'
red='\[\e[38;5;1m\]'
reset='\[\e[0m\]'
memepad=$red
pinecone='\[\e[38;5;94m\]'

PS1="[$grey\u$reset@$memepad\h$reset] "
PS1+="[$yellow\$(date +'%d/%m/%Y %H:%M:%S')$reset] "
PS1+="[$red\w$reset]\n"
PS1+="$white\$?$reset $ "

TERM=linux setterm -regtabs 4 # always set tabstop to 4

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

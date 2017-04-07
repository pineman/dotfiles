# .bashrc
eval $(dircolors ~/.dircolors)

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
# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars
# Examples:
# export dotfiles="$HOME/dotfiles"
# export projects="$HOME/projects"
# export documents="$HOME/Documents"
# export dropbox="$HOME/Dropbox"
export ist="$HOME/ist/a2s2"
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
PS1+="[$yellow$(date +"%H:%M:%S %d/%m/%Y")$reset] "
PS1+="[$red\w$reset]\n"
PS1+="$white\$?$reset $ "

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

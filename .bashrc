export HISTSIZE=200000
export HISTFILE=~/.bash_history
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL="ignoredups"
export HISTTIMEFORMAT="%x %X"
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
set +H
# Prompt
white='\[\e[38;5;15m\]'
yellow='\[\e[38;5;3m\]'
mag='\[\e[38;5;5m\]'
r='\[\e[0m\]'
PS1="$yellow\t$r bash $mag\$(pwd)$r\n"
PS1+="$white\$?$r $ "
. ~/.aliases

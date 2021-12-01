#[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach
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
grey='\[\e[38;5;244m\]'
red='\[\e[38;5;1m\]'
blue='\[\e[38;5;4m\]'
mag='\[\e[38;5;5m\]'
r='\[\e[0m\]'
PS1="$yellow\A$r $grey\u$r@$red\h$r:$mag\w$r\n"
PS1+="$white\$?$r $ "
. ~/.aliases
#[[ ${BLE_VERSION-} ]] && ble-attach

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zmodload zsh/complist

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect '^I' accept-search # Tab to accept
bindkey -M menuselect '^[' undo

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd V edit-command-line

# Search in history from buffer
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^B' history-beginning-search-menu

HISTFILE=~/.history
HISTSIZE=200000
SAVEHIST=200000

autoload -Uz compinit promptinit
compinit
promptinit

setopt APPEND_HISTORY HIST_IGNORE_DUPS
setopt AUTO_CD extendedglob nomatch notify nohup completeinword correct COMPLETE_ALIASES
bindkey -v
KEYTIMEOUT=1
bindkey '^?' backward-delete-char

PS1="[%F{10}%n%f@%F{1}%M%f] [%F{3}%D{%d/%m/%Y %H:%M:%S}%f] [%F{1}%~%f]
%F{15}%?%f $ "

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
bindkey '^L' autosuggest-accept
bindkey '^J' autosuggest-execute

[[ -f ~/.aliases ]] && . ~/.aliases

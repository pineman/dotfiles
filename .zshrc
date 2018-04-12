HISTFILE=~/.zsh_history
HISTSIZE=200000
SAVEHIST=200000

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' completer _expand _complete _match _correct _approximate _prefix
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' rehash true
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format 'completing %B%d%b'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect '^I' accept-search # Tab to accept
bindkey -M menuselect '^[' undo

# Launch vim to edit buffer
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd V edit-command-line

# Search in history from buffer
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^B' history-beginning-search-menu
bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward

setopt APPEND_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE EXTENDED_HISTORY
setopt AUTO_CD extendedglob nomatch notify nohup completeinword correct COMPLETE_ALIASES
setopt AUTO_CONTINUE
bindkey -v
KEYTIMEOUT=1
bindkey '^?' backward-delete-char

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^L' autosuggest-accept
bindkey '^H' autosuggest-execute

#autoload predict-on
#predict-on
#zle -N predict-on
#zle -N predict-off
#bindkey '^L' predict-on
#bindkey '^J' predict-off
#zstyle ':predict:*' toggle on

autoload -Uz vcs_info
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '-'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' actionformats '%a'
zstyle ':vcs_info:git:*' formats '[%F{4}%r%f %F{2}%b%f%F{1}%u%f%F{2}%c%f]'
zstyle ':vcs_info:*' enable git
precmd() {
	print -Pn "\e]0;%~\a"; # Change the terminal's title to current dir.
	vcs_info
}

ZLE_RPROMPT_INDENT=0
PROMPT='[%F{10}%n%f@%F{1}%M%f] [%F{3}%D{%H:%M}%f] [%F{5}%~%f] ${vcs_info_msg_0_}
%F{15}%?%f $ '

[[ "$(uname -s)" == "Linux" ]] && setterm --tabs 4

[[ -f ~/.aliases ]] && . ~/.aliases

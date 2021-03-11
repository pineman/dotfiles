#zmodload zsh/zprof
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt EXTENDED_HISTORY INC_APPEND_HISTORY_TIME HIST_FIND_NO_DUPS HIST_IGNORE_DUPS NO_HIST_IGNORE_SPACE
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_MINUS
setopt EXTENDED_GLOB GLOBDOTS NOMATCH NOTIFY NO_HUP LONG_LIST_JOBS
setopt AUTO_CONTINUE
setopt COMPLETE_IN_WORD COMPLETE_ALIASES INTERACTIVE_COMMENTS
setopt NO_SH_WORD_SPLIT
autoload -Uz compinit promptinit
compinit
promptinit
setopt PROMPT_SUBST
precmd() {
	# Change the terminal's title to current dir.
	print -Pn "\e]0;%~\a"
}
HOST_COLOR=94
PROMPT='%F{3}%D{%H:%M:%S}%f %F{244}%n%f@%F{$HOST_COLOR}%M%f:%F{5}%~%f (%F{1}$(if [[ $(git stash list 2>/dev/null) ]]; then echo +; fi)%f%F{2}$(git branch 2>/dev/null | \grep "^*" | colrm 1 2)%f $(basename $(git rev-parse --show-toplevel 2>/dev/null) 2>/dev/null))
%F{15}%?%f $ '
zstyle ':completion:*' completer _expand _complete _match _correct _approximate _prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' rehash true
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format $'completing %B%d%b'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' use-cache on
bindkey -v
autoload -U select-quoted select-bracketed surround
zle -N select-quoted
zle -N select-bracketed
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
KEYTIMEOUT=1
bindkey '^?' backward-delete-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect '^I' accept-search # Tab to accept
bindkey -M menuselect '^[' undo
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd V edit-command-line
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu-end-space history-beginning-search-menu
# start a string with a space and you can search in the entire string (arguments)
# instead of just the first word (command)
bindkey '^B' history-beginning-search-menu-end-space
bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^H' forward-word
bindkey '^L' autosuggest-accept
bindkey '^E' fasd-complete-d
bindkey '^R' fasd-complete-f
alias -g G='|& grep -i'
alias -g VI='|& vim -'
alias -g X='$(xclip -o)'
alias -g H='|& head'
alias -g T='|& tail'
alias -g L='|& less -R'
alias -s txt=cat
alias -s {timer,service}="sudo vim"
eval "$(fasd --init auto)"
eval "$(direnv hook zsh)"
alias d='dirs -v | tail -n +2 | head -10'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
. ~/.aliases
eval $(dircolors $HOME/.dircolors)
#zprof

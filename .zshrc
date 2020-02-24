HISTFILE=~/.zsh_history
HISTSIZE=900000
SAVEHIST=900000

autoload -Uz compinit promptinit
compinit
promptinit

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

bindkey -v  # vi mode
KEYTIMEOUT=1
bindkey '^?' backward-delete-char

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
zle -N history-beginning-search-menu-end-space history-beginning-search-menu
# start a string with a space and you can search in the entire string (arguments)
# instead of just the first word (command)
bindkey '^B' history-beginning-search-menu-end-space
bindkey "^K" history-beginning-search-backward
bindkey "^J" history-beginning-search-forward

setopt APPEND_HISTORY HIST_IGNORE_DUPS NO_HIST_IGNORE_SPACE EXTENDED_HISTORY NO_SH_WORD_SPLIT
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_MINUS
setopt EXTENDED_GLOB GLOBDOTS NOMATCH NOTIFY NO_HUP LONG_LIST_JOBS
setopt AUTO_CONTINUE RM_STAR_WAIT
setopt COMPLETE_IN_WORD CORRECT COMPLETE_ALIASES INTERACTIVE_COMMENTS

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^H' forward-word
bindkey '^L' autosuggest-accept
#bindkey '^H' autosuggest-execute

#autoload predict-on
#predict-on
#zle -N predict-on
#zle -N predict-off
#bindkey '^L' predict-on
#bindkey '^J' predict-off
#zstyle ':predict:*' toggle on

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

setopt PROMPT_SUBST
precmd() {
	print -Pn "\e]0;%~\a"; # Change the terminal's title to current dir.
}

PROMPT='%F{3}%D{%H:%M}%f %F{10}%n%f@%F{1}$(hostname -f)%f:%F{5}%~%f (%F{2}$(git branch 2>/dev/null | \grep "^*" | colrm 1 2)%f)
%F{15}%?%f $ '

# Bind file manager keys
# Alt + up - go to parent dir
# alt + left - go to last dir
cdUndoKey() {
  popd
  zle       reset-prompt
}
cdParentKey() {
  pushd ..
  zle      reset-prompt
}
zle -N cdParentKey
zle -N cdUndoKey
bindkey '^[^[[A' cdParentKey
bindkey '^[^[[D' cdUndoKey

# alt + enter to insert literal newline without accepting the command
bindkey '^[^M' self-insert-unmeta

# fasd - recently used files and dirs
eval "$(fasd --init auto)"
bindkey '^A' fasd-complete
bindkey '^E' fasd-complete-d
bindkey '^R' fasd-complete-f

. ~/.aliases
alias -g G='| grep -i'
alias -g VI='| vim -'
alias -g X='$(xclip -o)'
alias -g H='| head'
alias -g T='| tail'
alias -g L='| less'
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
alias -s txt=cat
alias -s {timer,service}="sudo vim"

#bindkey -s '^[r' 'rr\n'
#bindkey -s '^X^P' 'zathura --fork pdf^X^F'

eval "$(dircolors $HOME/.dircolors)"
eval "$(direnv hook zsh)"

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
#ZSH_HIGHLIGHT_STYLES[default]='fg=red'
ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt EXTENDED_HISTORY INC_APPEND_HISTORY_TIME HIST_FIND_NO_DUPS HIST_IGNORE_DUPS NO_HIST_IGNORE_SPACE
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_MINUS
setopt EXTENDED_GLOB GLOBDOTS NOMATCH NOTIFY NO_HUP LONG_LIST_JOBS
setopt AUTO_CONTINUE
setopt COMPLETE_IN_WORD COMPLETE_ALIASES INTERACTIVE_COMMENTS
setopt NO_SH_WORD_SPLIT
setopt PROMPT_SUBST
autoload -Uz compinit
compinit
zstyle ':completion:*' completer _expand _complete _match _correct _approximate _prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' rehash true
zmodload zsh/complist
zstyle ':completion:*' menu yes select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect '^I' accept-search # Tab to accept
bindkey -M menuselect '^[' undo
zstyle ':completion:*:descriptions' format $'completing %B%d%b'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' verbose true
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
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
KEYTIMEOUT=1
bindkey '^?' backward-delete-char
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
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
PROMPT='%F{3}%D{%H:%M:%S}%f zsh %F{5}%d%f (%F{2}$(git rev-parse --abbrev-ref HEAD 2>/dev/null)%f)
%F{15}%?%f $ '
precmd() {
	print -Pn "\e]0;%~\a"
}
alias -g G='|& grep -i'
alias -g V='|& vim -'
alias -g D='|& dragon-drop -I -s 300 -i -x'
alias -g L='|& less'
alias -g H='|& head'
alias -g T='|& tail'
alias -g A='|& tee -a'
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

export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --no-ignore-parent'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
source "/usr/share/fzf/key-bindings.zsh"

. ~/.aliases


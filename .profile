export EDITOR="vim"
#if [ $(command -v nvimpager) ]; then export PAGER="nvimpager"; fi
if [ $(command -v vimpager) ]; then export PAGER="vimpager"; fi
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export MATLAB_LOG_DIR="/dev/null"
export GCC_COLORS=1
export ERL_AFLAGS="-kernel shell_history enabled"
#export IDF_PATH="/opt/esp-idf"
#. /opt/esp-idf/export.sh &>/dev/null
#. ${IDF_PATH}/add_path.sh &>/dev/null

export PATH="$HOME/code/bin:$PATH:$GOPATH/bin"
export PATH="/usr/lib/ccache/bin:$PATH"
export PATH="$HOME/.gem/ruby/*/bin:$PATH"

eval $(dircolors $HOME/.dircolors)

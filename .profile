export EDITOR="vim"
#if [ $(command -v nvimpager) ]; then export PAGER="nvimpager"; fi
if [ $(command -v vimpager) ]; then export PAGER="vimpager"; fi
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/proj/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export MATLAB_LOG_DIR="/dev/null"

#export PATH="$HOME/code/bin:$HOME/.mathinstall/Executables:$HOME/.matlabinstall/bin:$PATH:$GOPATH/bin"
export PATH="$HOME/code/bin::$PATH:$GOPATH/bin"
export PATH="/usr/lib/ccache/bin:$PATH"

#eval $(dircolors $HOME/.dircolors)

if [ $(command -v redshift) ]; then redshift -o -m drm &>/dev/null; fi

[[ "$(uname -s)" == "Linux" ]] && setterm --tabs 4

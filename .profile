export EDITOR="nvim"
#if [ $(command -v nvimpager) ]; then export PAGER="nvimpager"; fi
if [ $(command -v vimpager) ]; then export PAGER="vimpager"; fi
export XDG_CONFIG_HOME="$HOME/.config"
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export MATLAB_LOG_DIR="/dev/null"
export GCC_COLORS=1
export ERL_AFLAGS="-kernel shell_history enabled"
export _JAVA_OPTIONS="-Djdk.gtk.version=3 -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.opengl=true"
#export IDF_PATH="/opt/esp-idf"
#. /opt/esp-idf/export.sh &>/dev/null
#. ${IDF_PATH}/add_path.sh &>/dev/null

export PATH="$HOME/code/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/lib/ccache/bin:$PATH"
export PATH=".:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval $(dircolors $HOME/.dircolors)

if [ $(command -v rbenv) ]; then eval "$(rbenv init -)"; fi

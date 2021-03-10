export PATH="$HOME/.local/bin:$PATH"
source $HOME/.ls_colors
export EDITOR="nvim"
export PAGER="nvimpager"
export DELTA_PAGER="less -R"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME="qt5ct"
export WINIT_HIDPI_FACTOR=1
export MOZ_WEBRENDER=1 MOZ_ENABLE_WAYLAND=1
export CLUTTER_BACKEND=wayland
export JAVA_FONTS="/usr/share/fonts/ttf"
#export _JAVA_OPTIONS="-Djdk.gtk.version=3 -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.opengl=true"
export _JAVA_AWT_WM_NONREPARENTING=1
export PYTHONSTARTUP="$HOME/.pythonrc"
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GCC_COLORS=1
export PATH="/usr/lib/ccache/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
#export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
#export PATH="$PATH:$GEM_HOME/bin"

export JAVA_HOME="$(/usr/libexec/java_home -v 15)"
#export JAVAFX_HOME="$HOME/local/share/javafx"

#export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/erlang/lib/erlang/man:$MANPATH"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

export HOMEBREW_NO_ANALYTICS=1

export PATH="$HOME/.local/bin:$PATH"
eval $(dircolors $HOME/.dircolors)
export EDITOR="nvim"
export PAGER="nvimpager"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export WINIT_HIDPI_FACTOR=1
export MOZ_WEBRENDER=1 MOZ_ENABLE_WAYLAND=1
#export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
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

source $HOME/.ls_colors
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export PAGER="nvimpager -p"
export DELTA_PAGER="less -R"
export MOZ_DISABLE_RDD_SANDBOX=1 MOZ_ENABLE_WAYLAND=1
export BROWSER="firefox"
export TERMINAL="alacritty"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORM="wayland" QT_QPA_PLATFORMTHEME="qt5ct"
export JAVA_FONTS="/usr/share/fonts/ttf"
#export _JAVA_OPTIONS="-Djdk.gtk.version=3 -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.opengl=true"
export _JAVA_AWT_WM_NONREPARENTING=1
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GCC_COLORS=1
export PATH="/usr/lib/ccache/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
#eval "$(rbenv init -)"
#export PATH="/home/pineman/.rbenv/versions/3.1.3/lib/ruby/gems/3.1.0:$PATH"
export KUBE_CONFIG_PATH="$HOME/.kube/config"
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"


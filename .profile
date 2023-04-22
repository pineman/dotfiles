source $HOME/.ls_colors
export EDITOR="nvim"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export DELTA_PAGER="less -R"
export MOZ_DISABLE_RDD_SANDBOX=1 MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1 # at least for runelite
export BROWSER="firefox"
export TERMINAL="alacritty"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORM="wayland" QT_QPA_PLATFORMTHEME="qt5ct"
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"
export KERL_BUILD_DOCS=yes
. /opt/asdf-vm/asdf.sh

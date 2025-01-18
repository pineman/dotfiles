source $HOME/.ls_colors
export EDITOR="nvim"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MOZ_DISABLE_RDD_SANDBOX=1 MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1 # at least for runelite
export BROWSER="firefox"
export TERMINAL="alacritty"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORM="wayland" QT_QPA_PLATFORMTHEME="qt5ct"
export KERL_BUILD_DOCS=yes
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/code/git/mit-scheme-12.1/install/bin:$PATH"
eval "$(mise activate zsh --shims)"

. "$HOME/.cargo/env"
# Added by Toolbox App
export PATH="$PATH:/home/pineman/.local/share/JetBrains/Toolbox/scripts"

# Leave at the end
export PATH="$HOME/.local/bin:$PATH"


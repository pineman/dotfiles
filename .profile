source $HOME/.ls_colors
export EDITOR="nvim"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export DELTA_FEATURES=+side-by-side
export MOZ_DISABLE_RDD_SANDBOX=1 MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1 # at least for runelite
#export BROWSER="firefox"
export TERMINAL="alacritty"
export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORM="wayland" QT_QPA_PLATFORMTHEME="qt5ct"
export KERL_BUILD_DOCS=yes
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/code/git/mit-scheme-12.1/install/bin:$PATH"
eval "$(mise activate zsh --shims)"

# macos
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-time/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export LANG=en_US.UTF-8
export LC_COLLATE=pt_PT.UTF-8
export LC_CTYPE=pt_PT.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=pt_PT.UTF-8
export LC_NUMERIC=pt_PT.UTF-8
export LC_TIME=pt_PT.UTF-8
export LC_ALL=
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PGGSSENCMODE="disable" # https://github.com/ged/ruby-pg/issues/538#issuecomment-1591629049
# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
# Added by Toolbox App
export PATH="$PATH:/Users/pineman/Library/Application Support/JetBrains/Toolbox/scripts"

source ~/.api-keys

# Leave at the end
export PATH="$HOME/.local/bin:$PATH"


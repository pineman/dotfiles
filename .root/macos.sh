#!/bin/bash
formulas=(
  mise
  bash
  fd
  fzf
  git
  git-delta
  git-extras
  git-gui
  gnu-time
  gnu-sed
  jq
  gron
  less
  moreutils
  ncdu
  neovim
  pandoc
  ripgrep
  grep
  rlwrap
  scc
  sd
  tmux
  zoxide
  watch
  coreutils
  difftastic
  rsync
  gnu-tar
  dfc
  gh
  postgresql@18 # proper psql linked to readline, instead of libpq's
  shellcheck
  entr
  tree
  wget
  goawk
  telnet
  cowsay
  rustup
  flyctl
)
casks=(
  alacritty
  alt-tab
  betterdisplay
  brave-browser
  karabiner-elements
  keepassxc
  linearmouse
  maccy
  rectangle
  visual-studio-code
  transmission
  hex-fiend
  ngrok
  zed
  orbstack
)
brew install --cask "${casks[@]}"
brew install --formula "${formulas[@]}"
brew install koekeishiya/formulae/skhd
brew services start skhd
brew install -s ./htop-vim.rb
# https://github.com/actuallymentor/battery/pull/163
# System settings
# Keyboard
#  * Change globe key to: Do nothing
#  * Shortcuts:
#    * function keys: use as F1..12
#    * Services -> Text -> disable man pages
#    * Mission Control: opt+1..4 to switch space
#    * screenshots: disable all, enable cmd+shift+4/5 as opt+shift+4/5
# Trackpad
#  * enable tapping
#  * disable smart zoom
# Accessibility three finger drag + more scroll speed
# Displays - night shift sunset to sunrise
# Dock on right, auto hide
# Change DNS servers
# Spotlight
#  * disable everything but applications and calc
#  * add home folder as privacy exception
# https://github.com/alacritty/alacritty/issues/5346#issuecomment-1055695103
# AltTab app -> on Cmd+esc (caps lock)
# Karabiner: caps lock is escape, tab is tab if alone but control if not
# this is because I can stand latency in the tab key but I can't stand latency on the escape key whatsoever
# Maccy: use Opt-P while in the cmd-shift-c menu to pin
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
# TODO: https://apple.stackexchange.com/questions/434555/can-you-completely-disable-desktop-switching-animation-on-macos
# TODO: https://gist.github.com/b0gdanw/b6fe449407465ddd6f2a657d71e1345c, https://gist.github.com/b0gdanw/c99e5b2eefad19932554a713384dcc70
# brave ctrl-l ctrl-h tabs: https://superuser.com/a/1260437 (settings -> keyboard -> keyboard shortcuts -> app shortcuts: Select Next Tab ^L, New Tab CmdT, New Tab to the Right ^T, Select Previous Tab ^H, Close Tab ^J
# to limit charging to 80%: see https://github.com/actuallymentor/battery/pull/163
#  - get the smc binary
#  - sudo smc -k CHWA -w 01

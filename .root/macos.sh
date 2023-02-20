#!/bin/bash
brew install --cask alacritty alt-tab betterdisplay brave-browser karabiner-elements keepassxc linearmouse rectangle visual-studio-code
brew install --formula asdf bash entr fd fzf git git-delta git-extras git-gui gnu-time jq less moreutils ncdu neovim pandoc ripgrep grep rlwrap scc sd tmux zoxide
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
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
# TODO: https://apple.stackexchange.com/questions/434555/can-you-completely-disable-desktop-switching-animation-on-macos
# TODO: https://gist.github.com/b0gdanw/b6fe449407465ddd6f2a657d71e1345c, https://gist.github.com/b0gdanw/c99e5b2eefad19932554a713384dcc70

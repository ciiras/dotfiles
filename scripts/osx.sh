#!/bin/zsh

curUser=$(whoami)

# Keyboard Repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Finder - Show All Files
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;

# Screenshots Location
ssDir="/Users/${curUser}/Pictures"
mkdir ${ssDir}
defaults write com.apple.screencapture location ${ssDir}

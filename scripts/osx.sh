#!/bin/zsh

curUser=$(whoami)

# Keyboard Repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Finder - Show All Files
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
# UNDO - defaults write com.apple.dock autohide-delay -float 0.5; defaults write com.apple.dock autohide-time-modifier -int 0.5 ;killall Dock

# Screenshots Location
ssDir="/Users/${curUser}/Pictures"
mkdir ${ssDir}
defaults write com.apple.screencapture location ${ssDir}

# Reduce Display Motion
defaults write com.apple.Accessibility ReduceMotionEnabled -bool true
defaults write com.apple.universalaccess reduceMotion -bool true # Having issues with this one

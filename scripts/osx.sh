#!/bin/zsh

# Keyboard Repeat
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Finder - Show All Files
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
# UNDO - defaults write com.apple.dock autohide-delay -float 0.5; defaults write com.apple.dock autohide-time-modifier -int 0.5 ;killall Dock

# Screenshots Location
screen_short_directory="$HOME/Pictures"
mkdir -p ${screen_short_directory}
defaults write com.apple.screencapture location ${screen_short_directory}

# Reduce Display Motion
defaults write com.apple.Accessibility ReduceMotionEnabled -bool true
defaults write com.apple.universalaccess reduceMotion -bool true # terminal executing command must have full disk access

# Disable Disk Ejection Warning
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd

# Ability to drag n drop any part of a window
defaults write -g NSWindowShouldDragOnGesture -bool true

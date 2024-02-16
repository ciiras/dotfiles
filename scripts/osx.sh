#!/bin/zsh

# Keyboard Repeat
    defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Finder
    # Show All Files
    defaults write com.apple.finder AppleShowAllFiles -boolean true
    # Disable animation when opening the Info window in Finder (cmd⌘ + i)
    defaults write com.apple.finder DisableAllAnimations -bool true

killall Finder

# Dock
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -int 0
    # Make all animations faster that are used by Mission Control.
    defaults write com.apple.dock expose-animation-duration -float 0.1
    # Disable animations when you open an application from the Dock.
    defaults write com.apple.dock launchanim -bool false

killall Dock

# Windows
    # Ability to drag n drop any part of a window
    defaults write -g NSWindowShouldDragOnGesture -bool true
    # Disable windows opening animation
    defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
    # Disable animations when opening a Quick Look window
    defaults write -g QLPanelAnimationDuration -float 0

# Screenshots Location
    screen_short_directory="$HOME/Pictures"
    mkdir -p ${screen_short_directory}
    defaults write com.apple.screencapture location ${screen_short_directory}

# Reduce Display Motion
    defaults write com.apple.Accessibility ReduceMotionEnabled -bool true
    defaults write com.apple.universalaccess reduceMotion -bool true # terminal executing command must have full disk access

# Disable Disk Ejection Warning
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool true && sudo pkill diskarbitrationd

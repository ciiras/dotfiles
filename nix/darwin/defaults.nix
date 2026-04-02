{ config, ... }: {
  system.defaults = {
    NSGlobalDomain = {
      InitialKeyRepeat = 15;
      KeyRepeat = 1;
      NSWindowShouldDragOnGesture = true;
      NSAutomaticWindowAnimationsEnabled = false;
    };
    finder = {
      AppleShowAllFiles = true;
    };
    dock = {
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      expose-animation-duration = 0.1;
      launchanim = false;
    };
    screencapture.location = "~/Pictures";
  };

  system.activationScripts.reduceMotion.text = ''
    sudo -u ${config.system.primaryUser} defaults write com.apple.universalaccess reduceMotion -bool true
  '';
}

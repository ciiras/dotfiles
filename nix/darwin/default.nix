{ pkgs, ... }: {
  imports = [ ./defaults.nix ];

  networking.hostName = "macbook";

  users.users."christopher.griffith" = {
    name = "christopher.griffith";
    home = "/Users/christopher.griffith";
  };

  system.primaryUser = "christopher.griffith";

  environment.systemPath = [ "/opt/homebrew/bin" "/opt/homebrew/sbin" ];

  environment.etc."zshenv.local".text = ''
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_RUNTIME_DIR="/run/user/$UID"
    export XDG_STATE_HOME="$HOME/.local/state"
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
  '';

  homebrew = {
    enable = true;
    onActivation.cleanup = "none"; # switch to "zap" after full validation
    taps = [
      "facebook/fb"
      "felixkratz/formulae"
      "nikitabobko/tap"
      "osx-cross/arm"
      "osx-cross/avr"
      "qmk/qmk"
      "xcodesorg/made"
      "samtay/tui"
    ];
    brews = [
      "felixkratz/formulae/borders"
      "facebook/fb/idb-companion"
      "osx-cross/arm/arm-gcc-bin@10"
      "osx-cross/avr/avr-gcc@9"
      "qmk/qmk/qmk"
      "grip"
      "jenv"
      "samtay/tui/tetris"
      "xcodesorg/made/xcodes"
    ];
    casks = [
      "nikitabobko/tap/aerospace"
      "android-commandlinetools"
      "betterdisplay"
      "confluent-cli"
      "flipper"
      "karabiner-elements"
      "kitty"
      "meteorologist"
      "mos"
      "notunes"
      "react-native-debugger"
      "stats"
      "temurin"
      "zulu@17"
    ];
  };

  nix.enable = false;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 5;
}

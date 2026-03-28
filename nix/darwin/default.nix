{ pkgs, ... }: {
  imports = [ ./defaults.nix ];

  networking.hostName = "macbook";

  users.users."christopher.griffith" = {
    name = "christopher.griffith";
    home = "/Users/christopher.griffith";
  };

  system.primaryUser = "christopher.griffith";

  environment.etc."zshenv.local".text = ''
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_RUNTIME_DIR="/run/user/$UID"
    export XDG_STATE_HOME="$HOME/.local/state"
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
  '';

  nix.enable = false;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 5;
}

{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Core tools
    neovim
    tmux
    git
    delta
    bat
    eza
    fzf
    ripgrep
    fd
    jq
    gh
    btop
    wget
    watch
    p7zip
    mas

    # Shell
    starship
    zoxide

    # Dev
    python312
    awscli2
    graphviz
    maven
    imagemagick

    # Fun
    cmatrix
  ];
}

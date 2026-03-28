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

    # File management
    trash-cli
    xdg-ninja
    glow

    # Network / HTTP
    httpie
    mitmproxy
    ngrok

    # Media
    ffmpeg
    imagemagick
    ghostscript
    scrcpy

    # Dev tools
    gitflow

    watchman
    docker-compose
    redis
    nginx
    graphviz
    maven

    # Version managers
    nodenv
    rbenv

    # Languages
    python312
    awscli2

    # Fonts
    nerd-fonts.fira-code

    # Fun
    fastfetch
    cmatrix
    asciiquarium
  ];
}

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export CLICOLOR=1
export DOT_FILES_DIR="$HOME/projects/dotfiles"
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto'
export HISTSIZE=10000

HOMEBREW_GITHUB_API_TOKEN="$(security find-generic-password -a "$USER" -s "HOMEBREW_GITHUB_API_TOKEN" -w)"
export HOMEBREW_GITHUB_API_TOKEN

export KEYTIMEOUT=1
export LESSHISTSIZE=0
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LS_COLORS=Gxfxcxdxbxegedabagacad
export LSCOLORS=Gxfxcxdxbxegedabagacad
export MANPAGER='less -X' # Don’t clear the screen after quitting a manual page
export NODENV_ROOT="$XDG_CONFIG_HOME/nodenv"
export ODY_ENV=true # Needs to exist for ~/projects/od-env/build-node-docker/gendockerfile.sh generate w/ nodemon

export PATH=./:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

export RBENV_ROOT="$XDG_CONFIG_HOME/rbenv"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/history"
export SAVEHIST=10000
export SHELL_SESSIONS_DISABLE=1
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_LOG='error'
export TERM='screen-256color'
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"
export VISUAL='nvim'

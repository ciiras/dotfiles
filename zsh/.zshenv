export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_SDK_EMULATOR="$ANDROID_SDK_ROOT/emulator"
export ANDROID_SDK_TOOLS=$ANDROID_SDK_ROOT/platform-tools
export CLICOLOR=1
export DOT_FILES_DIR="$HOME/projects/dotfiles"
export EDITOR='nvim'

NF_BLUE=75
NF_GREEN=72
NF_RED=124
NF_PURPLE=98
NF_WHITE=252
NF_YELLOW=186

EZA_DATE="da=38;5;${NF_YELLOW}"
EZA_DIR="di=38;5;${NF_BLUE}"
EZA_FILES="fi=38;5;${NF_WHITE}:ex=38;5;${NF_GREEN}"
EZA_HEADER="hd=34;4"
EZA_RIGHTS_GROUP="gr=38;5;${NF_YELLOW}:gw=38;5;${NF_RED}:gx=38;5;${NF_GREEN}"
EZA_RIGHTS_OTHER="tr=38;5;${NF_YELLOW}:tw=38;5;${NF_RED}:tx=38;5;${NF_GREEN}:xa=38;5;${NF_WHITE}"
EZA_RIGHTS_USER="ur=38;5;${NF_YELLOW}:uw=38;5;${NF_RED}:ux=38;5;${NF_GREEN}:ue=38;5;${NF_GREEN}"
EZA_SIZE="sn=38;5;${NF_GREEN}"
EZA_USER="uu=38;5;${NF_PURPLE}"
export EZA_COLORS="reset:${EZA_HEADER}:${EZA_RIGHTS_USER}:${EZA_RIGHTS_GROUP}:${EZA_RIGHTS_OTHER}:${EZA_SIZE}:${EZA_USER}:${EZA_DATE}:${EZA_DIR}:${EZA_FILES}"

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
export MANPAGER='less -X' # Don’t clear the screen after quitting a manual page
export NODENV_ROOT="$XDG_CONFIG_HOME/nodenv"
export ODY_ENV=true # Needs to exist for ~/projects/od-env/build-node-docker/gendockerfile.sh generate w/ nodemon
export PATH=".:$PATH"
export PATH="$ANDROID_SDK_EMULATOR:$PATH"
export PATH="$ANDROID_SDK_TOOLS:$PATH"

export RBENV_ROOT="$XDG_CONFIG_HOME/rbenv"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/history"
export SAVEHIST=10000
export SHELL_SESSIONS_DISABLE=1
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_LOG='error'
export TERM='screen-256color'
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"
export VISUAL='nvim'

export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_SDK_EMULATOR="$ANDROID_SDK_ROOT/emulator"
export ANDROID_SDK_TOOLS=$ANDROID_SDK_ROOT/platform-tools
export BAT_THEME=nightfox
export CLICOLOR=1
export DELTA_PAGER=$PAGER
export DOT_FILES_DIR="$HOME/projects/dotfiles"
export EDITOR='nvim'

nf_blue=75
nf_green=72
nf_purple=98
nf_orange=214
nf_white=252

EZA_DATE="da=38;5;${nf_blue}"
EZA_DIR="di=38;5;${nf_blue}"
EZA_FILES="fi=38;5;${nf_white}:ex=38;5;${nf_green}"
EZA_HEADER="hd=37;4"
EZA_RIGHTS_GROUP="gr=38;5;${nf_orange}:gw=38;5;${nf_purple}:gx=38;5;${nf_blue}"
EZA_RIGHTS_OTHER="tr=38;5;${nf_orange}:tw=38;5;${nf_purple}:tx=38;5;${nf_blue}:xa=38;5;${nf_white}"
EZA_RIGHTS_USER="ur=38;5;${nf_orange}:uw=38;5;${nf_purple}:ux=38;5;${nf_blue}:ue=38;5;${nf_blue}"
EZA_SIZE="sn=38;5;${nf_green}"
EZA_USER="uu=38;5;${nf_purple}"
export EZA_COLORS="reset:${EZA_HEADER}:${EZA_RIGHTS_USER}:${EZA_RIGHTS_GROUP}:${EZA_RIGHTS_OTHER}:${EZA_SIZE}:${EZA_USER}:${EZA_DATE}:${EZA_DIR}:${EZA_FILES}"

export FZF_ALT_C_OPTS="--preview 'eza --tree --level=1 --color=always {}'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS='--layout default --height 50% --tmux 70% --border'
export GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto'
export HISTDUP=erase

HOMEBREW_GITHUB_API_TOKEN="$(security find-generic-password -a "$USER" -s "HOMEBREW_GITHUB_API_TOKEN" -w)"
export HOMEBREW_GITHUB_API_TOKEN

export KEYTIMEOUT=20
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export LESSHISTSIZE=0
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export MANPAGER=$PAGER
export MODE_CURSOR_VIINS='#86ABDC blinking bar'
export MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #86ABDC"
export MODE_CURSOR_VICMD='#86ABDC blinking block'
export MODE_CURSOR_SEARCH='#86ABDC steady underline'
export MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady underline"
export MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #86ABDC"
export NODENV_ROOT="$XDG_CONFIG_HOME/nodenv"
export ODY_ENV=true # Needs to exist for ~/projects/od-env/build-node-docker/gendockerfile.sh generate w/ nodemon
export PAGER='less -+FX --mouse'

export PATH=".:$PATH"
export PATH="$ANDROID_SDK_EMULATOR:$PATH"
export PATH="$ANDROID_SDK_TOOLS:$PATH"

export RBENV_ROOT="$XDG_CONFIG_HOME/rbenv"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/history"
export SHELL_SESSIONS_DISABLE=1
export SDKMAN_DIR="$HOME/.sdkman"
export SDKMAN_INIT_FILE="$SDKMAN_DIR/bin/sdkman-init.sh"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_LOG='error'
export TERM='xterm-kitty'
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"
export VISUAL='nvim'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZVM_KEYTIMEOUT=0.1

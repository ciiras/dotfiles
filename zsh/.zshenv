export CLICOLOR=1
export DOT_FILES_DIR="$HOME/projects/dotfiles"
export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto'
export HISTSIZE=10000
export HOMEBREW_GITHUB_API_TOKEN="$(security find-generic-password -a "$USER" -s "HOMEBREW_GITHUB_API_TOKEN" -w)"
export KEYTIMEOUT=1
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
export ODY_ENV=true # Needs to exist for ~/projects/od-env/build-node-docker/gendockerfile.sh generate w/ nodemon
export SAVEHIST=10000
export TERM='screen-256color'
export VISUAL='nvim'

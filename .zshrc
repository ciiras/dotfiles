# Basic Settings {{{

# Path to your oh-my-zsh installation.
export ZSH=/Users/griffithc/.oh-my-zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Oh My ZSH Plugins {{{

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew docker git ripgrep tmux z)

# }}}

source $ZSH/oh-my-zsh.sh

# }}}

# User configuration {{{

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# }}}

# Exports {{{

export CLICOLOR=1
export EDITOR='nvim'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse-list --border'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export KEYTIMEOUT=5
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS=Gxfxcxdxbxegedabagacad
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export PATH=./:/Users/griffithc/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export TERM="screen-256color"

# }}}

# Alias {{{

alias cl="clear"
alias code="code-insiders"
alias d="docker"
alias dc="docker-compose"
alias dcd="dc down"
alias dcps="dc ps"
alias dcl="docker_compose_logs"
alias dcr="docker_compose_restart"
alias dcs="docker_compose_stop"
alias dcu="docker_compose_up"
alias dr="killall Docker && open /Applications/Docker.app"
alias du="dc ps | rg unhealthy"
alias g="nocorrect git"
alias gdsw="gds --word-diff"
alias glrbd="git pull --rebase origin develop"
alias glrbm="git pull --rebase origin master"
alias gmv="git mv"
alias gpu="git push -u origin HEAD"
alias gr="git reset"
alias grh="git reset --hard"
alias grs="git reset --soft"
alias gsta="git stash save"
alias gstapa="git stash save -p"
alias gstau="git stash save -u"
alias k="kubectl"
alias ll="ls -lha"
alias ls="ls -a"
alias ne="nodenv"
alias nrl="npm run lint"
alias r="source ~/.zshrc"
alias rc="~/projects/od-env/build-node-docker/render-consul-template.sh"
alias rg="nocorrect rg"
alias rgf="ripgrep_files"
alias rgn="ripgrep_file_names_only"
alias t="tmux"
alias vc="code config/consul.json"
alias vi="nvim"

# }}}

# Functions {{{

function docker_compose_up() { docker-compose up -d $@ && docker-compose logs -f $@ }
function docker_compose_restart() { docker-compose restart $@ && docker-compose logs -f $@ }
function docker_compose_logs() { docker-compose logs -f $@ }
function docker_compose_stop() { docker-compose stop $@ && docker-compose rm -f $@ }
function display_placer_set() {
    displayplacer "id:E4E6B386-B893-9D5B-A207-BA495AE1FC4E res:2560x1440 color_depth:4 scaling:off origin:(0,0) degree:0" "id:F466F621-B5FA-04A0-0800-CFA6C258DECD res:1680x1050 color_depth:4 scaling:on origin:(2560,358) degree:0" "id:9F831D7A-8A6E-816B-80CC-9043E3313BEC res:2560x1440 color_depth:4 scaling:off origin:(-2560,0) degree:0"
}
function ripgrep_files() { rg -g $@ --files }
function ripgrep_file_names_only() { rg $@ -l }

# }}}

# Auto Complete Fuzzy {{{

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' 'r:|?=** m:{a-z\-}={A-Z\_}'

# }}}

# Colours {{{

autoload colors; colors

# The variables are wrapped in \%\{\%\}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Clear LSCOLORS
unset LSCOLORS

# }}}

# Key Bindings {{{

bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward

# }}}

# Envrionment Management {{{

eval "$(nodenv init -)"

# }}}

# Vi mode {{{

bindkey -v #vim style

bindkey -M vicmd '^P' up-line-or-search
bindkey -M vicmd '^N' down-line-or-search

bindkey -M viins '^P' up-line-or-search
bindkey -M viins '^N' down-line-or-search

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^F' history-incremental-search-forward

bindkey -M vicmd '/' history-incremental-search-backward

bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

CURSOR_BLOCK='\e[1 q'
CURSOR_BEAM='\e[5 q'

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne $CURSOR_BLOCK
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne $CURSOR_BEAM
  fi
}
zle -N zle-keymap-select

preexec() { zle-keymap-select ;}
precmd_functions+=(zle-keymap-select)

# }}}

# ZPlugin {{{

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

zplugin light eendroroy/alien
export ALIEN_SECTIONS_LEFT=(
  exit
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  ssh
  venv
  versions
  prompt
)
export ALIEN_SECTION_PATH_COMPONENTS=2
export ALIEN_VERSIONS_PROMPT='NODE'

zplugin light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept

zplugin light zsh-users/zsh-syntax-highlighting

# }}}

# Basic Settings {{{

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

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
export ODY_ENV=true # Needs to exist for ~/projects/od-env/build-node-docker/gendockerfile.sh generate w/ nodemon
export TERM="screen-256color"

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
eval "$(jenv init -)"

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

# Zinit {{{

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

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/docker/docker.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
zinit snippet OMZ::plugins/z/z.plugin.zsh

zinit light eendroroy/alien
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

export ALIEN_PROMPT_FG=255
export ALIEN_SECTION_EXIT_FG=0
export ALIEN_SECTION_EXIT_BG=0
export ALIEN_SECTION_EXIT_BG_ERROR=255
export ALIEN_SECTION_TIME_FG=255
export ALIEN_SECTION_TIME_BG=235
export ALIEN_SECTION_BATTERY_FG=255
export ALIEN_SECTION_BATTERY_BG=237
export ALIEN_SECTION_USER_FG=255
export ALIEN_SECTION_USER_BG=239
export ALIEN_SECTION_PATH_FG=255
export ALIEN_SECTION_PATH_BG=241
export ALIEN_SECTION_VCS_BRANCH_FG=232
export ALIEN_SECTION_VCS_BRANCH_BG=243
export ALIEN_SECTION_VCS_STATUS_FG=232
export ALIEN_SECTION_VCS_STATUS_BG=245
export ALIEN_SECTION_VCS_DIRTY_FG=232
export ALIEN_SECTION_VCS_DIRTY_BG=247
export ALIEN_SECTION_SSH_FG=254
export ALIEN_SECTION_VENV_FG=252
export ALIEN_GIT_TRACKED_COLOR=234
export ALIEN_GIT_UN_TRACKED_COLOR=241
export ALIEN_SECTION_VERSION_BG=235
export ALIEN_PYTHON_COLOR=40
export ALIEN_RUBY_COLOR=196
export ALIEN_JAVA_COLOR=178
export ALIEN_GO_COLOR=81
export ALIEN_ELIXIR_COLOR=99
export ALIEN_CRYSTAL_COLOR=8
export ALIEN_NODE_COLOR=41
export ALIEN_PHP_COLOR=57

zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept

zinit light zsh-users/zsh-syntax-highlighting

zinit light kutsan/zsh-system-clipboard

# }}}

# Alias {{{

alias cl="clear"
alias code="code-insiders"
alias d="docker"
alias dc="docker-compose"
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
alias l="ls -lAh"
alias ls="ls"
alias ne="nodenv"
alias nrl="npm run lint"
alias r="source ~/.zshrc"
alias rc="~/projects/od-env/build-node-docker/render-consul-template.sh"
alias rd="~/projects/od-env/build-node-docker/gendockerfile.sh"
alias t="tmux"
alias vi="nvim"
alias v="nvim"

# }}}

# PATH {{{

export PATH="./:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# }}}

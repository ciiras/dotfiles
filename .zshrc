# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/griffithc/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="alien"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Oh My ZSH Plugins {{{

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker tmux brew)

# }}}

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Exports {{{
MONO=/Library/Frameworks/Mono.framework/Versions/Current/bin/
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
export ANDROID_SDK=~/Library/Android/sdk
export PATH=$ANDROID_SDK/platoform-tools:$JAVA_HOME:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$MONO
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export EDITOR="nvim"
export TERM="screen-256color"
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS=Gxfxcxdxbxegedabagacad
export FZF_DEFAULT_OPTS="--height 40% --reverse --border"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!/node_modules/*" --glob "!dist/*"'
# }}}

# Alias and Functions' {{{

alias r="source ~/.zshrc"

alias ls="ls -a"
alias ll="ls -lha"

alias t="tmux"
alias vi="nvim"
alias code="code-insiders"

alias dka="killall Docker && open /Applications/Docker.app"
alias rc="~/projects/od-env/build-node-docker/render-consul-template.sh"
alias vc="code config/consul.json"
alias cl="clear"
alias nrl="npm run lint"
alias uh="dc ps | rg unhealthy"

function rgf() { rg -g $@ --files }

alias gr="git reset"
alias grs="git reset --soft"
alias grh="git reset --hard"
alias gshno="git show --name-only"
alias glrbm="git pull --rebase origin master"
alias glrbd="git pull --rebase origin develop"
alias gsta="git stash save"
alias gstap="git stash push"
alias gstapa="git stash save -p"
alias gstau="git stash -u"
alias gpu="git push -u origin HEAD"
alias gmv="git mv"

alias d="docker"
alias dc="~/projects/od-env/docker-compose"
alias dcd="dc down"
function dcu() { ~/projects/od-env/docker-compose up -d $@ && ~/projects/od-env/docker-compose logs -f $@ }
function dcr() { ~/projects/od-env/docker-compose restart $@ && ~/projects/od-env/docker-compose logs -f $@ }
function dcl() { ~/projects/od-env/docker-compose logs -f $@ }
function dcs() { ~/projects/od-env/docker-compose stop $@ && ~/projects/od-env/docker-compose rm $@ }

function dpw() {
    displayplacer "id:E4E6B386-B893-9D5B-A207-BA495AE1FC4E res:2560x1440 color_depth:4 scaling:off origin:(0,0) degree:0" "id:F466F621-B5FA-04A0-0800-CFA6C258DECD res:1680x1050 color_depth:4 scaling:on origin:(2560,358) degree:0" "id:9F831D7A-8A6E-816B-80CC-9043E3313BEC res:2560x1440 color_depth:4 scaling:off origin:(-2560,0) degree:0"
}

alias k="kubectl"
# }}}

# Auto Correct Disable {{{
alias rg="nocorrect rg"
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

bindkey -v #vim style

bindkey "^r" history-incremental-search-backward
bindkey "^s" history-incremental-search-forward

# export KEYTIMEOUT=1 # softmoth/zsh-vim-mode plugin has this value set to 30

# }}}

# Envrionment Management {{{

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# }}}

# ZPlugin {{{

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zplugin light softmoth/zsh-vim-mode
MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="#00ff00 blinking block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady block"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

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
export ALIEN_SECTIONS_RIGHT=(
  time
)
export ALIEN_SECTION_PATH_COMPONENTS=3
export ALIEN_VERSIONS_PROMPT='NODE'
export ALIEN_SECTION_TIME_BG=NONE

zplugin light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC=1
bindkey '^ ' autosuggest-accept

# }}}

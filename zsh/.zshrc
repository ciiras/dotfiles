# Zinit {{{

	# {{{ Installer/Loader

	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
	[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
	[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

	source "${ZINIT_HOME}/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

	# }}}

	# Plugins {{{

    export ZSH_CACHE_DIR=$HOME/.local/share/zinit # not sure why i have to do this to make OMZP::docker work

	zinit for \
	    light-mode eendroroy/alien \
	    marlonrichert/zsh-autocomplete as"completions" OMZP::docker/completions/_docker \
	    OMZP::docker \
	    OMZP::docker-compose \
	    OMZP::git \
	    softmoth/zsh-vim-mode \
	    zsh-users/zsh-autosuggestions

	zinit wait lucid for \
	    kutsan/zsh-system-clipboard \
	    MichaelAquilina/zsh-you-should-use \
	    zsh-users/zsh-completions \
	    zsh-users/zsh-syntax-highlighting \
        z-shell/zsh-zoxide

	# }}}

# }}}

# eendroroy/alien config {{{

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

# }}}

# vim mode config {{{

MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green blinking block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady underline"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# }}}

# zsh-users/zsh-autosuggestions config {{{

export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
bindkey '^ ' autosuggest-accept

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

# }}}

# {{{ Timing

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# }}}

# Settings {{{

setopt CORRECT                   # Spelling correction
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt SHARE_HISTORY             # Share history between all sessions.

# }}}

# Auto Complete Fuzzy {{{

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' 'r:|?=** m:{a-z\-}={A-Z\_}'

# }}}

# Colors {{{

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

unset LSCOLORS

# }}}

# Language Management {{{

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(nodenv init -)"
eval "$(jenv init -)"
eval "$(rbenv init - zsh)"

# }}}

# Aliases {{{

alias cat=bat
alias cl=clear
alias d=docker
alias dc=docker-compose
alias g='nocorrect git'
alias gdsw='gds --word-diff'
alias glrbd='git pull --rebase origin develop'
alias glrbm='git pull --rebase origin master'
alias gmv='git mv'
alias gpu='git push -u origin HEAD'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gsta='git stash save'
alias gstapa='git stash save -p'
alias gstau='git stash save -u'
alias history='history 0'
alias k=kubectl
alias l='eza --long -all --git'
alias lg=lazygit
alias ne=nodenv
alias nrl='npm run lint'
alias r="source $ZDOTDIR/.zshrc"
alias rc=~/projects/od-env/build-node-docker/render-consul-template.sh
alias rd=~/projects/od-env/build-node-docker/gendockerfile.sh
alias rm=trash
alias t=tmux
alias top=btop
alias vi=nvim
alias v=nvim

# }}}

# PATH {{{

export PATH=./:$PATH

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH

# }}}

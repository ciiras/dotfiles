# Plugin Manager {{{

	# {{{ Zinit

	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit"
	[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
	[ ! -d "${ZINIT_HOME}/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

    # shellcheck disable=SC1091,SC1094
	source "${ZINIT_HOME}/zinit.zsh"
    autoload -Uz _zinit

    # shellcheck disable=SC2154
    (( ${+_comps} )) && _comps[zinit]=_zinit

	# }}}

	# Plugins {{{

	zinit light kutsan/zsh-system-clipboard
    zinit light MichaelAquilina/zsh-you-should-use
    zinit light softmoth/zsh-vim-mode
    zinit light zsh-users/zsh-completions

    # shellcheck disable=SC2016
    zinit ice from"gh-r" as"program" atload'eval "$(starship init zsh)"'; zinit light starship/starship

    # shellcheck disable=SC2016
    zinit ice from"gh-r" as"program" atload'eval "$(zoxide init --cmd c zsh)"'; zinit light ajeetdsouza/zoxide

    zinit snippet OMZL::git.zsh
    zinit snippet OMZP::docker
    zinit snippet OMZP::docker-compose
    zinit snippet OMZP::git
    zinit snippet OMZP::sudo
    zinit snippet OMZP::aws
    zinit snippet OMZP::kubectl
    zinit snippet OMZP::kubectx
    zinit snippet OMZP::command-not-found

    autoload -Uz compinit && compinit
    zinit ice silent as"plugin" wait atload='enable-fzf-tab'; zinit light Aloxaf/fzf-tab
    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-autosuggestions

    # zsh-users/zsh-autosuggestions config
    export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    export ZSH_AUTOSUGGEST_USE_ASYNC=1
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

    # shellcheck disable=SC2154
    bindkey "${terminfo}[kcbt]" reverse-menu-complete
    bindkey '^I' menu-complete # Tab/STab cycle through completions w/o selecting one
    bindkey '^ ' autosuggest-accept

    # 0 -- vanilla completion (abc => abc)
    # 1 -- smart case completion (abc => Abc)
    # 2 -- word flex completion (abc => A-big-Car)
    # 3 -- full flex completion (abc => ABraCadabra)
    zstyle ':completion:*' matcher-list '' 'r:|?=** m:{a-z\-}={A-Z\_}'

    zstyle ':completion:*:git-checkout:*' sort false # disable sort when completing `git checkout`
    zstyle ':completion:*:descriptions' format '[%d]' # set descriptions format to enable group support
    zstyle ':completion:*' menu no # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
    zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept # custom fzf flags NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
    zstyle ':fzf-tab:*' switch-group '<' '>' # switch group using `<` and `>`

	# }}}

# }}}

# Options {{{

setopt APPENDHISTORY             # Append, not overwrite history
setopt AUTO_CD                   # cd used when arguments entered w/ no prefixed command
setopt CORRECT                   # Spelling correction
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt GLOB_STAR_SHORT           # Enable ** and *** as shortcuts for **/* and ***/*, respectively.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove unnecessary spaces
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY        # Append to the end of the history file.
setopt NO_CLOBBER                # > won't overwrite existing files. Use >!
setopt NUMERIC_GLOB_SORT         # Display file names in numerical, not lexicographical order
setopt SHARE_HISTORY             # Share history between all sessions.

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

# Functions {{{
function gbDa () {
    git branch --no-color | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -D 2> /dev/null
}

fzf_history_widget() {
  local selected
  selected=$(fc -rl 1 | fzf --height 40% --reverse --query "$LBUFFER") && LBUFFER=$(echo "$selected" | sed 's/^[0-9]\+\s*//')
  zle reset-prompt
}
zle -N fzf_history_widget
bindkey '^P' fzf_history_widget

function previous_dir() {
  c -
}

function resource() {
    source "$ZDOTDIR/.zshenv"
    source "$ZDOTDIR/.zshrc"
    echo "zsh config reloaded"
}

# }}}

# Aliases {{{

alias -- -='previous_dir'
alias cat=bat
alias cd=c
alias cl=clear
alias d=docker
alias dc=docker-compose
alias g='nocorrect git'
alias gcps="git cherry-pick --skip"
alias gdsw='git diff --staged --word-diff'
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
alias l='eza --long -all --git --icons=always -h'
alias ne=nodenv
alias nrl='npm run lint'
alias r='resource'
alias rc=~/projects/od-env/build-node-docker/render-consul-template.sh
alias rd=~/projects/od-env/build-node-docker/gendockerfile.sh
alias rm=trash
alias t=tmux
alias top=btop
alias v=nvim
alias vi=nvim

# }}}

# eval {{{

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(jenv init -)"
eval "$(nodenv init -)"
eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"

# }}}


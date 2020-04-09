#!/usr/bin/env zsh

THEME_ROOT="/Users/griffithc/.oh-my-zsh/custom/themes"
NEWLINE=$'\n'

source "${THEME_ROOT}/libs/promptlib/activate"
source "${THEME_ROOT}/libs/zsh-async/async.zsh"
source "${THEME_ROOT}/libs/zsh-256color/zsh-256color.plugin.zsh"

source "${THEME_ROOT}/modules/python.zsh"
source "${THEME_ROOT}/modules/init.zsh"
source "${THEME_ROOT}/modules/async.zsh"
source "${THEME_ROOT}/modules/system.zsh"
source "${THEME_ROOT}/modules/git.zsh"
source "${THEME_ROOT}/modules/theme.zsh"

function alien_dummy(){}

function node_prompt_version {
    if which node &> /dev/null; then
        echo "%{$fg_bold[blue]%}node(%{$fg[red]%}$(node -v)%{$fg[blue]%}) %{$reset_color%}"
    fi
}

function alien_lprompt_complete() {
  if [[ $(alien_is_git) == 1 ]]; then
      PROMPT='%(?.%K{$color0}%F{$color1}%f%k.)%K{$color3}%F{$color0}%f%k%K{$color5}%F{$color3}%f%k%K{$color5}%F{$color6} %1~ %f%k%F{$color5}%K{$color7}%k%f%K{$color7}%F{$color9}$(alien_git_branch)%f%k%K{$color10}%F{$color7}%f%k%K{$color10}%F{$color11}$(alien_git_lr) %f%k%K{$color12}%F{$color10}%f%k%K{$color12}%F{$color13}$(alien_git_dirty) %f%k%F{$color12}%f${NEWLINE}%F{$color3}$(alien_ssh_client)%f%F{$color14}`alien_venv`%f%F{$color8}%B❱%b%f $(node_prompt_version)'
  else
    PROMPT='%(?.%K{$color0}%F{$color1}%f%k.)%K{$color3}%F{$color0}%f%k%K{$color5}%F{$color3}%f%k%K{$color5}%F{$color6} %1~ %f%k%F{$color5}%f${NEWLINE}%F{$color3}$(alien_ssh_client)%f%F{$color14}`alien_venv`%f%F{$color8}%B❱%b%f $(node_prompt_version)'
  fi
  zle && zle reset-prompt
  async_stop_worker lprompt -n
}

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst

  RPROMPT='$(plib_time)'

  async_init
  async_start_worker lprompt -n
  async_register_callback lprompt alien_lprompt_complete
  async_job lprompt alien_dummy
}

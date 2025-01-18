# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no beep sound when complete list displayed
#
setopt nolistbeep

###
## Set other shell options
####
setopt auto_menu auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

# alias
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias bd='cd -'
alias rm='rm -i'
alias ..='cd ..'
alias ll='eza -alh --icons'
alias find='fd'
alias ag='rg'
alias bex='bundle exec'
alias up='docker compose up'
alias dcx='docker compose exec'
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'

# ENV
export XDG_CONFIG_HOME=$HOME/.config
export SVN_EDITOR="vim"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/Cellar/mysql-client@8.0/8.0.40/bin:$PATH"
# For Android development
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME="$HOME/Library/Android/sdk"

# For Flutter development
export FLUTTER_HOME=$HOME/flutter/flutter

export PATH="$ANDROID_HOME/cmdline-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise
eval "$(mise activate zsh)"

# skim
function skim-select-history() {
  local target=$(history -n -r 1 | sk --query "$LBUFFER" --prompt="History > ")

  if [ -n "$target" ]; then
    BUFFER=$target
    CURSOR=$#BUFFER
  fi
  zle reset-prompt
}
zle -N skim-select-history
bindkey '^r' skim-select-history

# starship
eval "$(starship init zsh)"

# sheldon
eval "$(sheldon source)"

# jump
eval "$(jump shell)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

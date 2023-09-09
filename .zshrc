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
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias ..='cd ..'
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
# For Android development
export ANDROID_STUDIO_JDK_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
export JAVA_HOME=$ANDROID_STUDIO_JDK_HOME
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_STUDIO_JDK_HOME/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Homebrew
eval "$(/usr/local/bin/brew shellenv)"

# rbenv
eval "$(rbenv init - zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_LEGACY_KEYBINDINGS=0
export FZF_TMUX=1
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# starship
eval "$(starship init zsh)"

# sheldon
eval "$(sheldon source)"

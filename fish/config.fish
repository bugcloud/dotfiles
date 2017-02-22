# Homebrew
set -U fish_user_paths /usr/local/bin $fish_user_paths

# bobthefish theme
set -g theme_nerd_fonts yes
set -g theme_color_scheme light
set -g theme_display_hg no
set -g theme_display_ruby yes
set -g theme_date_format "+%H:%M:%S"

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
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'

# ENV
export XDG_CONFIG_HOME=$HOME/.config
export SVN_EDITOR="vim"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Homebrew
set -U fish_user_paths /usr/local/bin $fish_user_paths
eval "$(/usr/local/bin/brew shellenv)"

# bobthefish theme
set -g theme_nerd_fonts yes
set -g theme_color_scheme light
set -g theme_display_hg no
set -g theme_display_ruby yes
set -g theme_date_format "+%H:%M:%S"
set -g theme_display_git no

# fzf
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_TMUX 1

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
set -x XDG_CONFIG_HOME $HOME/.config
set -x SVN_EDITOR vim

# Added by the Heroku Toolbelt
set -x PATH $HOME/bin $PATH

# For Android development
set -x ANDROID_STUDIO_JDK_HOME "/Applications/Android Studio.app/Contents/jre/Contents/Home"
set -x JAVA_HOME $ANDROID_STUDIO_JDK_HOME
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $ANDROID_STUDIO_JDK_HOME/bin $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# rbenv
rbenv init - | source

# nvm
set -gx nvm_prefix /usr/local/Cellar/nvm/0.39.3

# pyenv
. (pyenv init - | psub)

# iTerm2 Shell Integration
source ~/.iterm2_shell_integration.fish

# jump
status --is-interactive; and source (jump shell fish | psub)

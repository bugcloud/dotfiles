#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source ~/.gibo-completion.zsh

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

###
## Set other shell options
####
setopt auto_menu correct auto_name_dirs auto_remove_slash
setopt extended_history hist_ignore_dups
setopt pushd_ignore_dups rm_star_silent sun_keyboard_hack
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias du="du -h"
alias df="df -h"

alias su="su -l"

#################################################################################
# to use git HEAD^^
typeset -A abbreviations
abbreviations=(
    "L"    "| $PAGER"
    "G"    "| grep"

    "HEAD^"     "HEAD\\^"
    "HEAD^^"    "HEAD\\^\\^"
    "HEAD^^^"   "HEAD\\^\\^\\^"
    "HEAD^^^^"  "HEAD\\^\\^\\^\\^\\^"
    "HEAD^^^^^" "HEAD\\^\\^\\^\\^\\^"
)

magic-abbrev-expand () {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9^]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
}

magic-abbrev-expand-and-insert () {
    magic-abbrev-expand
    zle self-insert
}

magic-abbrev-expand-and-accept () {
    magic-abbrev-expand
    zle accept-line
}

no-magic-abbrev-expand () {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-insert
zle -N magic-abbrev-expand-and-accept
zle -N no-magic-abbrev-expand
bindkey "\r"  magic-abbrev-expand-and-accept # M-x RET はできなくなる
bindkey "^J"  accept-line # no magic
bindkey " "   magic-abbrev-expand-and-insert
bindkey "."   magic-abbrev-expand-and-insert
bindkey "^x " no-magic-abbrev-expand
#################################################################################

alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cd='pushd'
alias bd='popd'
alias ..='cd ..'
alias bex='bundle exec'
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'
# Only Mac OS X
alias ctags="`brew --prefix`/bin/ctags"
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

export PATH="$HOME/bin:$HOME/.gitscripts:$HOME/node_modules/coffee-script/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/git-core/contrib/diff-highlight:$PATH"

export XDG_CONFIG_HOME=$HOME/.config

export SVN_EDITOR="vim"

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

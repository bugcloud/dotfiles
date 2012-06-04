# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem compleat rails3 ruby rvm heroku)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
#
#
# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8


## Default shell configuration
#
# set prompt
#
setopt prompt_subst
autoload colors
colors
#case ${UID} in
#0)
#    PROMPT="%B%{${fg[yellow]}%}%/#%{${reset_color}%}%b "
#    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#    ;;
#*)
#    PROMPT="%{${fg[yellow]}%}%/%%%{${reset_color}%} "
#    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#    ;;
#esac
#RPROMPT=$'%B%{\e[$[32+$RANDOM%5]m%}{%n[@]$HOST}%{\e[m%}'

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

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
#   to end of it)
#
bindkey -d

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

case "${OSTYPE}" in
darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    ;;
freebsd*)
    case ${UID} in
    0)
        updateports() 
        {
            if [ -f /usr/ports/.portsnap.INDEX ]
            then
                portsnap fetch update
            else
                portsnap fetch extract update
            fi
            (cd /usr/ports/; make index)

            portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac


## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

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

#################################################################################
#
# Copied from
# http://intridea.com/2011/5/18/its-not-enough-to-bash-in-heads-youve-got-to-bash-in-minds-with-zsh
#
# Shows little symbol '±' if you're currently at a git repo and '○' all other times
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


# Build the main prompt
if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)${return_code}$(git_prompt_status)%{$reset_color%}
$(virtualenv_info)$(prompt_char) '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # Display exitcode on the right when >0
    return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

    # Loads rvm info to the right side of the zsh prompt showing: ruby-version@gemset-name
    RPROMPT='$(~/.rvm/bin/rvm-prompt)'

    # Displays different symbols (simultaneously) depending on the current status of your git repo.
    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
else
    PROMPT='[%n@%m:%~$(git_prompt_info)]
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # Display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='${return_code}$(git_prompt_status)'

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
#################################################################################
 
#################################################################################
#
# Copied from
# https://github.com/mooz/percol#readme
#################################################################################
function exists { which $1 &> /dev/null }
if exists percol; then
  function percol_select_history() {
    local tac
    exists gtac && tac=gtac || tac=tac
    BUFFER=$($tac $HISTFILE | sed 's/^: [0-9]*:[0-9]*;//' | percol --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }

  zle -N percol_select_history
  bindkey '^R' percol_select_history
fi
#################################################################################

alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cd='pushd'
alias bd='popd'
alias showpubip="GET checkip.dyndns.org|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'"
alias bex='bundle exec'
alias r='bundle exec rails'
alias pd='bundle exec padrino'
alias rspec='bundle exec rspec -fs --color'
alias ccb='bundle exec cucumber --guess'
alias nave='~/.nave/nave.sh'
alias cmdfu='cmdline-fu matching'
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

export PATH="$PATH:$HOME/bin:$HOME/.gitscripts:$HOME/android/android-sdk-linux/tools:$HOME/android/android-sdk-linux/platform-tools:$HOME/android/android-ndk-r7:$HOME/node_modules/coffee-script/bin"
export SVN_EDITOR="vim"
export GDK_NATIVE_WINDOWS=1
export JAVA_HOME="/usr/lib/jvm/java-6-openjdk/"
export OPENCV_PACKAGE_DIR="$HOME/workspace/OpenCV-2.3.1"

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source "$HOME/.rvm/scripts/rvm"
fi

#if [[ -f $HOME/.nave/nave.sh ]]; then
#  $HOME/.nave/nave.sh use latest
#fi

#echo '
#                                                                                                                                     dddddddd
#BBBBBBBBBBBBBBBBB                           GGGGGGGGGGGGG                    lllllll                 UUUUUUUU     UUUUUUUU           d::::::d
#B::::::::::::::::B                       GGG::::::::::::G                    l:::::l                 U::::::U     U::::::U           d::::::d
#B::::::BBBBBB:::::B                    GG:::::::::::::::G                    l:::::l                 U::::::U     U::::::U           d::::::d
#BB:::::B     B:::::B                  G:::::GGGGGGGG::::G                    l:::::l                 UU:::::U     U:::::UU           d:::::d 
#  B::::B     B:::::Buuuuuu    uuuuuu G:::::G       GGGGGG    cccccccccccccccc l::::l    ooooooooooo   U:::::U     U:::::U    ddddddddd:::::d 
#  B::::B     B:::::Bu::::u    u::::uG:::::G                cc:::::::::::::::c l::::l  oo:::::::::::oo U:::::D     D:::::U  dd::::::::::::::d 
#  B::::BBBBBB:::::B u::::u    u::::uG:::::G               c:::::::::::::::::c l::::l o:::::::::::::::oU:::::D     D:::::U d::::::::::::::::d 
#  B:::::::::::::BB  u::::u    u::::uG:::::G    GGGGGGGGGGc:::::::cccccc:::::c l::::l o:::::ooooo:::::oU:::::D     D:::::Ud:::::::ddddd:::::d 
#  B::::BBBBBB:::::B u::::u    u::::uG:::::G    G::::::::Gc::::::c     ccccccc l::::l o::::o     o::::oU:::::D     D:::::Ud::::::d    d:::::d 
#  B::::B     B:::::Bu::::u    u::::uG:::::G    GGGGG::::Gc:::::c              l::::l o::::o     o::::oU:::::D     D:::::Ud:::::d     d:::::d 
#  B::::B     B:::::Bu::::u    u::::uG:::::G        G::::Gc:::::c              l::::l o::::o     o::::oU:::::D     D:::::Ud:::::d     d:::::d 
#  B::::B     B:::::Bu:::::uuuu:::::u G:::::G       G::::Gc::::::c     ccccccc l::::l o::::o     o::::oU::::::U   U::::::Ud:::::d     d:::::d 
#BB:::::BBBBBB::::::Bu:::::::::::::::uuG:::::GGGGGGGG::::Gc:::::::cccccc:::::cl::::::lo:::::ooooo:::::oU:::::::UUU:::::::Ud::::::ddddd::::::dd
#B:::::::::::::::::B  u:::::::::::::::u GG:::::::::::::::G c:::::::::::::::::cl::::::lo:::::::::::::::o UU:::::::::::::UU  d:::::::::::::::::d
#B::::::::::::::::B    uu::::::::uu:::u   GGG::::::GGG:::G  cc:::::::::::::::cl::::::l oo:::::::::::oo    UU:::::::::UU     d:::::::::ddd::::d
#BBBBBBBBBBBBBBBBB       uuuuuuuu  uuuu      GGGGGG   GGGG    ccccccccccccccccllllllll   ooooooooooo        UUUUUUUUU        ddddddddd   ddddd'
#
#

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

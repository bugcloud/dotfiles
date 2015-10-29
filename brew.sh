#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
# upgrade

# Add Repository
brew tap homebrew/versions || true
brew tap homebrew/binary || true

# Packages
brew install autoconf
brew install automake
brew install cmake
brew install curl
brew install fontconfig
brew install wget
brew install w3m
brew install ctags
brew install git
brew install tig
brew install mercurial
brew install brew-cask
brew install readline
brew install --HEAD ruby-build
brew install node
brew install gettext
brew install openssl
brew install the_silver_searcher
brew install tmux
brew install reattach-to-user-namespace
brew install cocot
brew install tree
brew install vim
brew install macvim
brew install mogenerator
brew install nginx
brew install mysql
brew install imagemagick
brew install rbenv
brew install rbenv-default-gems
brew install gibo
brew install direnv

# .dmg
brew cask install appcleaner
brew cask install bettertouchtool
brew cask install cheatsheet
brew cask install dropbox
brew cask install evernote
brew cask install filezilla
brew cask install firefox
brew cask install google-chrome
brew cask install handbrake
brew cask install imageoptim
brew cask install iterm2
brew cask install karabiner
brew cask install kobito
brew cask install virtualbox
brew cask install vagrant
brew cask install skitch
brew cask install skype
brew cask install slicy
brew cask install vlc
brew cask install xtrafinder
brew cask install clipmenu
brew cask install gyazo
brew cask install atom

# Remove outdated versions
brew cleanup

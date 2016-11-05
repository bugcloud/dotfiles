#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
# upgrade

# Add Repository
brew tap homebrew/versions
brew tap homebrew/binary
brew tap caskroom/cask

# Packages
brew install autoconf
brew install automake
brew install cmake
brew install curl
brew install wget
brew install git
brew install tig
brew install mercurial
brew install readline
brew install --HEAD ruby-build
brew install node
brew install gettext
brew install openssl
brew install tmux
brew install tree
brew install vim
brew install macvim
brew install nginx
brew install mysql
brew install imagemagick
brew install rbenv
brew install gibo

# .dmg
brew cask install appcleaner
brew cask install atom
brew cask install bitbar
brew cask install cheatsheet
brew cask install filezilla
brew cask install handbrake
brew cask install iterm2
brew cask install karabiner
brew cask install virtualbox
brew cask install vagrant
brew cask install vlc
brew cask install xtrafinder
brew cask install clipy
brew cask install gyazo
brew cask install bettertouchtool

# Remove outdated versions
brew cleanup

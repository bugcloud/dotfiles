#!/bin/bash

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
# upgrade

# Packages
brew install autoconf
brew install automake
brew install cmake
brew install curl
brew install wget
brew install git
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install tig
brew install mercurial
brew install readline
brew install --HEAD ruby-build
brew install node
brew install gettext
brew install openssl
brew install tmux
brew install tree
brew install mysql
brew install imagemagick
brew install rbenv
brew install reattach-to-user-namespace
brew install gibo
brew install lua
brew install macvim --with-override-system-vim --with-lua --with-python@2
brew linkapps macvim
brew install fish
brew install the_silver_searcher
brew install yarn
brew install jq
brew install ffmpeg

# .dmg
brew cask install appcleaner
brew cask install atom
brew cask install bitbar
brew cask install cheatsheet
brew cask install filezilla
brew cask install handbrake
brew cask install vlc
brew cask install xtrafinder
brew cask install clipy
brew cask install gyazo
brew cask install bettertouchtool
brew cask install font-hack-nerd-font
brew cask install swimat
brew cask install sequel-pro

# Remove outdated versions
brew cleanup

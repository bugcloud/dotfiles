#!/bin/bash

DOT_FILES=( .zshrc .zpreztorc .gitconfig .gitignore .gitscripts .gitattributes .vimrc .vim .tmux.conf .editorconfig bin itermcolors .pryrc uncrustify.cfg )
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

wget -O ~/.gibo-completion.zsh https://raw.githubusercontent.com/simonwhitaker/gibo/master/gibo-completion.zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

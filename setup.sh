#!/bin/bash

DOT_FILES=( .zshrc .gitconfig .gitignore .gitscripts .irbrc .vimrc .vim .tmux.conf .conkycolors bin itermcolors)
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done


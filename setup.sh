#!/bin/bash

DOT_FILES=( .zshrc .gitconfig .gitignore .gitscripts .irbrc .vimrc .vim .tmux.conf .editorconfig bin itermcolors .pryrc uncrustify.cfg Brewfile )
for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

wget -O ~/.gibo-completion.zsh https://raw.githubusercontent.com/simonwhitaker/gibo/master/gibo-completion.zsh

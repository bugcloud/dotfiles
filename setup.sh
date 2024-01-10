#!/bin/bash

brew install jump mise fig fzf sheldon starship exa

DOT_FILES=( .zshrc .gitconfig .gitignore .vimrc .vim .tmux.conf .editorconfig bin itermcolors .pryrc uncrustify.cfg )
for file in ${DOT_FILES[@]}
do
  ln -snfv $HOME/dotfiles/$file $HOME/$file
done

mkdir ${HOME}/.config
ln -snfv ${HOME}/.vim ${HOME}/.config/nvim
ln -snfv ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim
ln -snfv ${HOME}/dotfiles/.config/starship.toml ${HOME}/.config/starship.toml
mkdir -p ${HOME}/.config/sheldon
ln -snfv ${HOME}/dotfiles/.config/sheldon/plugins.toml ${HOME}/.config/sheldon/plugins.toml

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

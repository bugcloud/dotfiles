#!/bin/bash

# fish shell
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher z fzf rbenv edc/bass omf/theme-bobthefish

DOT_FILES=( .gitconfig .gitignore .vimrc .vim .tmux.conf .editorconfig bin itermcolors .pryrc uncrustify.cfg )
for file in ${DOT_FILES[@]}
do
  ln -snfv $HOME/dotfiles/$file $HOME/$file
done

FISH_FILES=( 'fish/config.fish' 'fish/fishfile' )
for file in ${FISH_FILES[@]}
do
  ln -snfv $HOME/dotfiles/$file $HOME/.config/$file
done

mkdir ${HOME}/.config
ln -snfv ${HOME}/.vim ${HOME}/.config/nvim
ln -snfv ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

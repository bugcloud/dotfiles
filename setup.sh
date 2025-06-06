#!/bin/bash

brew install jump mise direnv sk sheldon starship eza ripgrep fd bat

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
mkdir -p ${HOME}/.config/karabiner
ln -snfv ${HOME}/dotfiles/.config/karabiner/karabiner.json ${HOME}/.config/karabiner/karabiner.json
mkdir -p ${HOME}/.claude
ln -snfv ${HOME}/dotfiles/.claude/setting.json ${HOME}/.claude/setting.json

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

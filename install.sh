#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

ln -s $(pwd)/p10k.zsh $HOME/.p10k.zsh
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/gitignore_global $HOME/.gitignore_global

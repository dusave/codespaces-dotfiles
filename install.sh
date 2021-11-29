#!/bin/bash

exec > >(tee -i $HOME/dotfiles_install.log)
exec 2>&1
set -x

rm $HOME/.zshrc 2> /dev/null

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  CHSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]; then
  git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-nvm ]; then
  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
fi

ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/p10k.zsh $HOME/.p10k.zsh
ln -s $(pwd)/gitignore_global $HOME/.gitignore_global
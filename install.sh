#! /usr/bin/sh
# This script literally only sets up zsh.
set -e

# install zsh
sudo pacman -S zsh > /dev/null

# symlink .zshrc to $HOME
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# change default shell to zsh
chsh -s $(which zsh)

# install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# run bootstrap.zsh
zsh && source bootstrap.zsh
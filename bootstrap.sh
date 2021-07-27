#! /usr/bin/sh
set -e

# install zsh
sudo pacman -S zsh

# install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# install nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
sudo pacman -S --needed base-devel openssl zlib xz
cd ~/.pyenv && src/configure && make -C src

# symlink .zshrc to $HOME
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

zsh # run zsh

# install node LTS
if [[ "$(command -v nvm)" == "nvm" ]]; then
    nvm install --lts
else
    echo "nvm was not installed correctly"
fi

# install yarn
npm install --global yarn

# install python
pyenv install 3.8.5
pyenv global 3.8.5

# ln vimfiles
ln -s $HOME/dotfiles/vimfiles $HOME/.vim/vimfiles
# and install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# change default shell to zsh (requires restart)
chsh -s $(which zsh) 

#! /usr/bin/zsh
# Install stuff. Make use of .zshrc configs.
set -e

# install nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# install node LTS
nvm install --lts
# install yarn
npm install --global yarn

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
sudo pacman -S --needed base-devel openssl zlib xz
cd ~/.pyenv && src/configure && make -C src
# install python 3.8.5
pyenv install 3.8.5
pyenv global 3.8.5

# install Golang
sudo pacman -S go go-tools

# ln vimfiles
ln -s $HOME/dotfiles/vimfiles $HOME/.vim/vimfiles
# and install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

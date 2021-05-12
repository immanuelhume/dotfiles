#! /usr/bin/sh
set -e

# install curl
sudo apt install curl

# install zsh
sudo apt install zsh

# install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# install nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
sudo apt install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
cd ~/.pyenv && src/configure && make -C src

# install poetry
py=$(which python | which python3)
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | $py - --no-modify-path

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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

#install python
pyenv install 3.8.5
pyenv global 3.8.5

# change default shell to zsh (requires restart)
chsh -s $(which zsh) 

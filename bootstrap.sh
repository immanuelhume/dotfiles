# install zsh
sudo apt install zsh
chsh -s $(which zsh)

# install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# install nvm + node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh
if [[ "$(command -v nvm)" == "nvm" ]]; then
    nvm install --lts
else
    echo "nvm was not installed correctly"
fi

# install yarn
npm install --global yarn

# install poetry
py=$(which python3 | which python)
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | $py - --no-modify-path

# symlink .zshrc to $HOME
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
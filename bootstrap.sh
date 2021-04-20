# install zsh
sudo apt install zsh
chsh -s $(which zsh)

# install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# install nvm + node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | sh
if [ "$(command -v nvm)" == "nvm" ]; then
    nvm install --lts
else
    echo "nvm was not installed correctly"
fi

# install yarn
npm install --global yarn

# install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
sudo apt install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
cd ~/.pyenv && src/configure && make -C src
exec $SHELL # reload shell
pyenv install 3.9.4
pyenv global 3.9.4

# install poetry
py=$(which python | which python3)
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | $py - --no-modify-path

# symlink .zshrc to $HOME
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
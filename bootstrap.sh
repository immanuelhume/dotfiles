# install zsh
sudo apt install zsh
chsh -s $(which zsh)

# install antigen
curl -L git.io/antigen > antigen.zsh

# install nvm + node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
if [["$(command -v nvm)" == "nvm"]]; then
    nvm install --lts
else
    echo "\u001b[31mnvm was not installed correctly\u001b[0m"
fi

# install poetry
py=$(which python3 | which python)
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | $py - --no-modify-path

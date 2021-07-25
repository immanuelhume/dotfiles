source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle docker
antigen bundle docker-compose
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting # must come as last bundle

antigen theme robbyrussell

antigen apply

fpath+=~/.zfunc # for completions scripts
autoload -Uz compinit && compinit

source ~/dotfiles/exports.zsh
source ~/dotfiles/aliases.zsh
source ~/dotfiles/path.zsh

unset LESS

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
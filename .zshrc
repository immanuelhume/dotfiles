# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle docker
antigen bundle docker-compose
antigen bundle zsh-users/zsh-syntax-highlighting # must come as last bundle

antigen theme romkatv/powerlevel10k

antigen apply

fpath+=~/.zfunc # for completions scripts
autoload -Uz compinit && compinit

export EDITOR='nvim'
export PYENV_ROOT=$HOME/.pyenv
export PROJECTS=$HOME/Projects
export DOTFILES=$HOME/dotfiles
export ANDROID_SDK=/home/junyi/Android/Sdk

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source "$HOME/.cargo/env"

unset LESS

source ~/dotfiles/aliases.zsh
source ~/dotfiles/path.zsh

# this block should be near the end, it manipulates PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

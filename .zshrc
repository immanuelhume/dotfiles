source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle docker
antigen bundle docker-compose
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting # must come as last bundle

antigen theme candy

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

PATH="/home/junyi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/junyi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/junyi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/junyi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/junyi/perl5"; export PERL_MM_OPT;

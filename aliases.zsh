# general shortcuts
alias c='clear'
alias reloadshell='source ~/.zshrc'
alias path='echo -e ${PATH//:/"\n"}'
mkcd()
{
    mkdir -p -- $1 && cd -- $1
}
killport()
{
    kill -9 $(lsof -t -i :$1)
}

# directories
alias proj='cd $PROJECTS'
alias dot='cd $DOTFILES'
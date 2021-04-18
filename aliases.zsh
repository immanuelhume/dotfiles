# general shortcuts
alias c='clear'
alias path='echo -e ${PATH//:/"\n"}'
mkcd()
{
    mkdir -p -- $1 && cd -- $1
}
killport()
{
    kill -9 $(lsof -t -i :$1)
}
alias codes='code --disable-gpu'

# directories
alias proj='cd $PROJECTS'
alias dot='cd $DOTFILES'
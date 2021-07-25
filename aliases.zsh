# utility stuff
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

# git
alias gacan='git add : && git commit --amend --no-edit'

# golang
alias ggo='go run *.go'
# Utility 
alias c='clear'
alias path='echo -e ${PATH//:/"\n"}'
alias ranger='. ranger'
mkcd()
{
    mkdir -p -- $1 && cd -- $1
}
killport()
{
    kill -9 $(lsof -t -i :$1)
}

# Git
alias gacan='git add :/ && git commit --amend --no-edit'

# Golang
alias ggo='go run *.go'


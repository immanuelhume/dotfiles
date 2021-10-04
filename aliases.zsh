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
alias pullmods='rclone sync -v gdrive:nus-modules ~/Documents/nus-modules'
alias pushmods='rclone sync -v ~/Documents/nus-modules gdrive:nus-modules'
alias pulltextbooks='rclone sync -v gdrive:Textbooks ~/Documents/Textbooks'
alias pushtextbooks='rclone sync -v ~/Documents/Textbooks gdrive:Textbooks'

# git
alias gacan='git add : && git commit --amend --no-edit'

# golang
alias ggo='go run *.go'


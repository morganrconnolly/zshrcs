gch() {
    gca $1 && git push && glh
}
glh() {
    git rev-list --abbrev-commit -1 HEAD  | pbcopy && pbpaste
}
gca() {
    git commit -a -m $1
}
alias gco="git checkout"
alias gcc="git rev-list --abbrev-commit -1 HEAD | pbcopy && pbpaste"
alias gc='git commit'
alias ga="git add"
alias gd="git diff"
alias gb="git branch"
alias gs="git status"
alias gss="git status --short"
alias gb='git branch'
alias gp="git push"

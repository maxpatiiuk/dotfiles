# potentially destructive commands like rm, reset, merge, rebase and
# push do not have aliases to prevent accidents

# also, I know that git has a native support for aliases, but I don't
# like having to type `git s` when I can just type `gs` and be done
# with it

alias gg="git log --graph --oneline --pretty=format:\"%C(yellow)%h %Cgreen%an %Cblue%ar %Cred%s%Creset %C(auto)%d%Creset\""
alias gl="git log --graph --stat"
alias g-="git switch -"
alias gs="git status"
alias gr="git status && git pull --rebase && git status"
alias gf="git fetch && git status"
alias gdw="git diff"
alias gd="git diff --color-words"
alias gdcw="git diff --cached"
alias gdc="git diff --color-words --cached"
alias gi="git add --interactive"
alias gc="git commit"
alias gca="git commit --amend"
alias gb="git branch -vv"
alias gba="git branch -vv --all"
alias gp="pre-commit run"
alias gpa="pre-commit run --all-files"

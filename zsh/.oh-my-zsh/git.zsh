# Potentially destructive commands like rm, reset, restore, merge,
# rebase, mv and push do not have aliases to prevent accidents

# Also, I know that git has a native support for aliases, but I don't
# like having to type `git s` when I can just type `gs` and be done
# with it

alias gg="git log --graph --oneline --pretty=format:\"%C(yellow)%h %Cgreen%an %Cblue%ar %Cred%s%Creset %C(auto)%d%Creset\""
alias gl="git log --graph --stat"
alias g-="git switch -"
alias g--="git switch"
alias gs="git status"
alias gsi="git status --ignored"
alias gr="git status && git pull --rebase && git status"
alias gf="git fetch && git status"
alias gdw="git diff --stat -p"
alias gd="git diff --stat -p --color-words"
alias gdcw="git diff --stat -p --cached"
alias gdc="git diff --stat -p --color-words --cached"
alias gi="git add --interactive"
alias gri="git rebase -i"
alias gc="git commit"
alias gcae="git commit --amend"
alias gca="git commit --amend --no-edit"
alias gb="git branch -vv"
alias gba="git branch -vv --all"
alias gp="pre-commit run"
alias gpa="pre-commit run --all-files"
alias ghs="git stash push"
alias ghh="git stash show"
alias ghp="git stash pop"
alias ghl="git stash list"

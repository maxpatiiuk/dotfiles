# Potentially destructive commands like rm, reset, restore, merge,
# rebase, mv and push do not have aliases to prevent accidents

# Also, I know that git has a native support for aliases, but I don't
# like having to type `git s` when I can just type `gs` and be done
# with it

alias gg="git log --graph --oneline --pretty=format:\"%C(yellow)%h %Cgreen%an %Cblue%ar %Cred%s%Creset %C(auto)%d%Creset\""
alias gl="git log --graph --stat --all"
alias glc="git log --graph --stat -1 -p"
alias gll="git log --graph --stat --all --no-abbrev-commit"
alias g-="git switch -"
alias g--="git switch"
alias gs="git status"
alias gsi="git status --ignored"
alias gf="git fetch && git status"
alias gdw="git diff --stat -p"
alias gd="git diff --stat -p --color-words"
alias gdcw="git diff --stat -p --cached"
alias gdc="git diff --stat -p --color-words --cached"
alias ga="git add"
alias gi="git add --interactive"
alias gri="git rebase -i"
alias gc="git commit -v"
alias gcae="git commit -v --amend"
alias gca="git commit -v --amend --no-edit"
alias gba="git branch -vv --all"
alias gp="pre-commit run"
alias gpa="pre-commit run --all-files"
alias ghs="git stash push"
alias ghh="git stash show -p"
alias ghp="git stash pop"
alias ghl="git stash list"

# Fix GPG not working on Ubuntu
export GPG_TTY=$TTY

# Adapted from:
# https://github.com/paulirish/git-recent/blob/master/git-recent
branch='%(color:yellow)%(refname:short)%(color:reset)'
spacer='%(color:black) %(color:reset)'
format="\
%(HEAD) \
$branch|\
%(color:bold red)%(objectname:short)%(color:reset) \
%(color:bold green)(%(committerdate:relative))%(color:reset) \
%(color:bold blue)%(authorname)%(color:reset) \
%(color:yellow)%(upstream:track)%(color:reset)
$spacer|\
%(contents:subject)
$spacer|"


alias gb='git for-each-ref \
    --color=always \
    --count=0 \
    --sort=-committerdate \
    "refs/heads/"  \
    --format="$format" \
  | column -ts "|" \
  | less \
    --tabs=4 \
    --quit-if-one-screen \
    --RAW-CONTROL-CHARS \
    --no-init'

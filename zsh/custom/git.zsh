# Potentially destructive commands like rm, reset, restore, merge,
# rebase, mv and push do not have aliases to prevent accidents

# Also, I know that git has a native support for aliases, but I don't
# like having to type `git s` when I can just type `gs` and save
# thousands of keystokes yearly

alias gg="git log --graph --oneline --pretty=format:\"%C(yellow)%h %Cgreen%an %Cblue%ar %Cred%s%Creset %C(auto)%d%Creset\""
alias gl="git log --graph --stat"
alias glc="git log --graph --stat -1 -p --pretty=fuller"
alias gll="git log --graph --stat --all --no-abbrev-commit"
alias g-="git switch -"
alias g--="git switch"
alias gs="git status --short --branch"
alias gss="git status --branch"
alias gsi="git status --branch --ignored"
alias gf="git fetch && git status"
alias gdw="git diff --stat -p"
# The default regex breaks iTerm (default regex ends with |[<C0>-<FF>][<80>-<BF>]+)
regex="\"[a-zA-Z_][a-zA-Z0-9_]*|[-+0-9.e]+[jJlL]?|0[xX]?[0-9a-fA-F]+[lL]?|[-+*/<>%&^|=!]=|//=?|<<=?|>>=?|\*\*=?|[^[:space:]]\""
alias gd="git diff --stat -p --word-diff=color --word-diff-regex=${regex}"
alias gdcw="git diff --stat -p --cached"
alias gdc="git diff --stat -p --word-diff=color --word-diff-regex=${regex} --cached"
alias ga="git add"
alias gap="git add --patch"
alias gi="git add --interactive"
alias gri="git rebase --interactive"
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

# I found myself accidentally running `git restore -W` when I meant to
# call `git restore -S`. Thus, separate aliases that more explicitly
# explain action of each command have been added
alias gunstage="git restore -S"
alias gdelete="git restore -W"
alias gunstagedelete="git restore -SW"

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

# Like "git show" but opens the file in editor with syntax highlighting
gh() {
  ARG=$1
  FILE_NAME="${ARG##*:}"
  FILE_EXTENSION="${FILE_NAME##*.}"
  BARE_TEMP_FILE=`mktemp`
  TEMP_FILE="${BARE_TEMP_FILE}.${FILE_EXTENSION}"
  mv ${BARE_TEMP_FILE} ${TEMP_FILE}

  git show $1 > $TEMP_FILE
  ${EDITOR} ${TEMP_FILE}
  rm ${TEMP_FILE}
}

# When merging and have conflicts, can use this to show the commits
# that this branch has that the other doesn't for a given file
#
# Example usage:
# git checkout branchA
# git merge branchB
# # merge conflicts occurred...
# gm components/Atoms/className.ts
# Which translates into:
# gl branchA --not branchB -p -- components/Atoms/className.ts
alias gm='gl $(git_current_side) --not $(git_other_side) -p -- '

# Similar to gm, but flips the branches.
#
# Example usage:
# gm components/Atoms/className.ts
# Which translates into:
# gl branchB --not branchA -p -- components/Atoms/className.ts
alias gmm='gl $(git_other_side) --not $(git_current_side) -p -- '

git_other_side() {
  # Helper function to get the full name of the other side branch in
  # a git merge or rebase
  echo $( \
    git branch --all --contains \
    $( \
      # Handle the Merge and Pull request cases \
      cat "$(git rev-parse --show-toplevel)/.git/MERGE_HEAD" 2>/dev/null \
      || cat "$(git rev-parse --show-toplevel)/.git/rebase-merge/onto" 2>/dev/null \
    ) \
    | # Filter out lines like "* (no branch, rebasing xml-editor)" \ 
      grep -v "(" \
    | # Only take first line - any line should work, but we need just one \
      head -n 1 \
  )
}
git_current_side() {
  current_branch=$(git branch --show-current)
  
  # If current_branch is empty, handle the detached HEAD case
  if [ -z "$current_branch" ]; then
    current_branch=$(cat "$(git rev-parse --show-toplevel)/.git/ORIG_HEAD")
  fi

  echo $current_branch
}

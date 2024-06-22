# Potentially destructive commands like rm, reset, restore, merge,
# rebase, mv and push do not have aliases to prevent accidents

# Also, I know that git has a native support for aliases, but I don't
# like having to type `git s` when I can just type `gs` and save
# thousands of keystokes yearly

alias gg="git log --graph --oneline --pretty=format:\"%C(yellow)%h %Cgreen%an %Cblue%ar %Cred%s%Creset %C(auto)%d%Creset\""
alias ggb='gg origin/$(git branch --show-current)'
alias gl="git log --graph --stat"
alias glb='gl origin/$(git branch --show-current)'
alias glbc='gl origin/$(git branch --show-current) --stat -1 -p --pretty=fuller'
alias glc="git log --graph --stat -1 -p --pretty=fuller"
alias gll="git log --graph --stat --all --no-abbrev-commit"
alias glu='git log --graph --stat --not $(git symbolic-ref refs/remotes/origin/HEAD --short)'
alias g-="git switch -"
alias g--="git switch"
alias g---='git switch $(git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@")'
alias g="git status --short --branch"
alias gss="git status --branch"
alias gsi="git status --branch --ignored"
alias gf="git fetch && git status"
alias gdw="git diff --stat -p"
# The default regex breaks iTerm (default regex ends with |[<C0>-<FF>][<80>-<BF>]+)
regex="\"[a-zA-Z_][a-zA-Z0-9_]*|[-+0-9.e]+[jJlL]?|0[xX]?[0-9a-fA-F]+[lL]?|[-+*/<>%&^|=!]=|//=?|<<=?|>>=?|\*\*=?|[^[:space:]]\""
alias gd="git diff --stat -p --word-diff=color --word-diff-regex=${regex}"
alias gdcw="git diff --stat -p --cached"
alias gdwc="gdcw"
alias gdc="git diff --stat -p --word-diff=color --word-diff-regex=${regex} --cached"
alias gduw='git diff $(git merge-base HEAD $(git symbolic-ref refs/remotes/origin/HEAD)) --cached --stat -p'
alias gdu='gduw --word-diff=color --word-diff-regex=${regex}'
alias gdbw='git diff origin/$(git branch --show-current) --cached --stat -p'
alias gdb='gdbw --word-diff=color --word-diff-regex=${regex}'
alias gdn='git diff --stat -p --not $(git symbolic-ref refs/remotes/origin/HEAD --short)'
alias ga="git add"
alias gap="git add --interactive"
gi() {
 git add --patch $@
}
compdef _git gi=git-add
alias gri="git rebase --interactive"
alias gru='git rebase $(git symbolic-ref refs/remotes/origin/HEAD --short)'
# Do not open the editor to edit the commit message by default
alias grc="GIT_EDITOR=: git rebase --continue"
alias grce="git rebase --continue"
alias gbc="git cherry-pick --continue"
alias gmc="git merge --continue"
alias gc="git commit -v"
alias gcae="git commit -v --amend"
alias gca="git commit -v --amend --no-edit"
# Such commit is intended to be squashed using interactive rebase:
alias gcf="git commit -v -m 'chore: fixup'"
alias gba="git branch -vv --all"
alias gp="git cherry-pick"
alias gpc="GIT_EDITOR=: git cherry-pick --continue"
alias gpce="git cherry-pick --continue"
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
compdef _git gh=git-show

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

# Helper function to get the other side commit in a git merge or rebase
git_other_side() {
    original_pwd=$(pwd)
    cd $(git rev-parse --show-toplevel)
    if [ -d ".git/rebase-merge" ]; then
        # Rebasing (merge style)
        cat ".git/rebase-merge/onto-name" 2>/dev/null || cat ".git/rebase-merge/onto" 2>/dev/null
    elif [ -d ".git/rebase-apply" ]; then
        # Rebasing (apply style) or applying a patch
        cat ".git/rebase-apply/original-commit" 2>/dev/null || cat ".git/rebase-apply/onto" 2>/dev/null
    elif [ -f ".git/MERGE_HEAD" ]; then
        # Merging
        git show -s --pretty=%D ".git/MERGE_HEAD" 2>/dev/null | awk -F', ' '{print $2}'
    elif [ -f ".git/CHERRY_PICK_HEAD" ]; then
        # Cherry-picking
        git show -s --pretty=%H ".git/CHERRY_PICK_HEAD" 2>/dev/null
    else
        echo "Not in a middle of a known Git operation."
        cd "$original_pwd"
        return 1
    fi
    cd "$original_pwd"

}
compdef _git git_other_side=git-log

git_current_side() {
  current_branch=$(git branch --show-current)

  # If current_branch is empty, handle the detached HEAD case
  if [ -z "$current_branch" ]; then
    current_branch=$(cat "$(git rev-parse --show-toplevel)/.git/ORIG_HEAD")
  fi

  echo $current_branch
}
compdef _git git_current_side=git-log
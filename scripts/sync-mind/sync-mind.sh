#!/bin/zsh

set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GIT_TERMINAL_PROMPT=0

mkdir -p "$HOME/.local/state"
exec >> "$HOME/.local/state/sync-mind.log" 2>&1
trap 'exit_code=$?; print "$(date -Iseconds) sync finished (exit $exit_code)"' EXIT
print "$(date -Iseconds) sync started"

cd -P "$HOME/g/mind-upload"
[[ "$(git rev-parse --show-toplevel)" == "$PWD" ]]
[[ "$(git symbolic-ref --short HEAD)" == main ]]
[[ "$(git rev-parse --abbrev-ref '@{upstream}')" == origin/main ]]

for operation in MERGE_HEAD rebase-merge rebase-apply CHERRY_PICK_HEAD REVERT_HEAD BISECT_START sequencer; do
  if [[ -e "$(git rev-parse --git-path "$operation")" ]]; then
    print -u2 "Refusing to sync during an unfinished Git operation: $operation"
    exit 1
  fi
done

git fetch origin main
if ! git merge-base HEAD FETCH_HEAD; then
  print -u2 "Local main and origin/main have unrelated histories; reconcile them manually before syncing"
  exit 1
fi

git add .
if git diff --cached --quiet; then
  print "No staged changes to commit"
else
  git commit -m "chore: sync"
fi

if ! git pull --rebase --no-autostash origin main; then
  if [[ -d "$(git rev-parse --git-path rebase-merge)" || -d "$(git rev-parse --git-path rebase-apply)" ]]; then
    git rebase --abort
  fi
  print -u2 "Pull failed; local commits retained and push skipped"
  exit 1
fi

git -c push.followTags=false push origin HEAD:refs/heads/main
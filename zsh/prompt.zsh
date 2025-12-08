# Explicit setup for async git prompt
autoload -Uz add-zsh-hook

# State variables
typeset -g GIT_PROMPT_STATUS=""
typeset -g ASYNC_PROC_PID=0

# This function triggers when the background process finishes and sends SIGUSR1
function TRAPUSR1() {
  # Read the result from the temporary file
  local result_file="/tmp/zsh_prompt_git_$$"
  
  if [[ -f "$result_file" ]]; then
    GIT_PROMPT_STATUS=$(<"$result_file")
    rm -f "$result_file"
  fi

  # Reset the async PID tracker
  ASYNC_PROC_PID=0

  # Trigger a redraw of the prompt
  # zle reset-prompt checks if the line editor is active before redrawing
  zle && zle reset-prompt
}

# 2. The Background Worker
# This function runs inside a subshell
function async_git_worker() {
  local result_file=$1
  local parent_pid=$2
  
  # Loop up till folder with .git folder is found
  local dir="$PWD"
  while [[ "$dir" != "/" && ! -d "$dir/.git" ]]; do
    dir=$(dirname "$dir")
  done

  if [[ "$dir" == "/" ]]; then
    # Not a git repo
    echo -n " " > "$result_file"
    kill -s USR1 "$parent_pid"
    return
  fi

  local branch=""
  local ahead_behind_arrows=""
  # Read .git/HEAD file
  local head_file="$dir/.git/HEAD"
  if [[ -f "$head_file" ]]; then
    local ref=$(<"$head_file")
    if [[ "$ref" == ref:\ refs/heads/* ]]; then
      # If branch, read branch name
      branch=${ref#ref: refs/heads/}

      local git_rev_list_output=$(git rev-list --left-right --count HEAD...@'{u}' 2> /dev/null || true)
      local rev_list_exit=$?
      # 128 typically indicates no upstream configured
      if [[ $rev_list_exit -eq 128 ]]; then
        # No upstream
        return
      elif [[ $rev_list_exit -ne 0 ]]; then
        # Unknown error
        return
      else
        # Parse tab-separated counts: "<left>\t<right>"
        local -a nums
        nums=(${(ps:\t:)git_rev_list_output})
        (( nums[2] > 0 )) && ahead_behind_arrows+="⇣"
        (( nums[1] > 0 )) && ahead_behind_arrows+="⇡"
      fi

    elif [[ "$ref" =~ ^[0-9a-f]{40}$ ]]; then
      # If commit, read first 8 chars
      branch=${ref:0:8}
    fi
  fi


  # Count stashes
  local stash_count=$(git rev-list --walk-reflogs --count refs/stash 2>/dev/null || echo "")
  
  local dirty_star=""
  if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    dirty_star="*"
  fi

  local prompt_meta=" ${branch} ${dirty_star}${ahead_behind_arrows}${stash_count}"
  # Write result and signal parent
  echo -n "$prompt_meta" > "$result_file"
  kill -s USR1 "$parent_pid"
}

# Runs before every prompt display
function start_async_git_fetch() {
  # Kill previous background process if it's still running (user typed fast)
  if [[ $ASYNC_PROC_PID -ne 0 ]]; then
    kill -s TERM "$ASYNC_PROC_PID" 2>/dev/null
  fi
  
  local result_file="/tmp/zsh_prompt_git_$$"
  
  # Start the worker in background
  # Passing current PID ($$) so worker knows who to signal
  async_git_worker "$result_file" "$$" &! 
  
  # Store the background PID
  ASYNC_PROC_PID=$!
}

# Update prompt before any command
add-zsh-hook precmd start_async_git_fetch

# Allow prompt variable substitution
setopt prompt_subst

# Make prompt character red if previous command exited with non-zero
PROMPT='%F{blue}%~%f${GIT_PROMPT_STATUS}%(?.%F{135}.%F{red})❯%f '
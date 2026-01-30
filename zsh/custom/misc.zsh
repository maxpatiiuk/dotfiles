source ~/s/git/private-dotfiles/zsh/custom/env.sh

# Clipboard:
# pbcopy < input.txt
# echo "text" | pbcopy
# pbpaste > output.txt

### basic
alias ls="ls -G1"
alias ll="ls -GahlFT%"
alias l="python3 ~/s/python/dir-explorer/dir_explorer/list_files.py"

### cd && l
function cl() {
  DIR="$*"
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME
  fi
  builtin cd "${DIR}" && l
}
compdef cl=cd

### one line server
alias pw="python3 -m http.server 8080"

### shortcuts
alias v="nvim"
alias vim="nvim"
alias p="python3"
alias n="node"
alias ni="node --inspect"
alias nib="node --inspect-brk"
alias vimdiff="nvim -d"

function m() {
  if [ ! -t 0 ]; then
    # stdin is piped into the function
    less
  elif [ "$#" -eq 0 ]; then
    npm install
  else
    npm "$@"
  fi
}

function h() {
  if [ "$#" -eq 0 ]; then
    pnpm install
  else
    pnpm "$@"
  fi
}
alias hi="pnpm install"

# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Colored man pages. Wrapped in a function to not pollute `env`
# See https://unix.stackexchange.com/questions/119/colors-in-man-pages
man() {
  # begin bold (blue fg)
  # begin blink (red fg)
  # begin reverse video (yellow fg, blue bg)
  # begin underline (green fg)
  # reset bold/blink
  # reset reverse video
  # reset underline
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;34m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_so=$(printf "\e[1;43;34m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    man "$@"
}

# Exit with the exit code of previous command
# Usage:
# You have a long running command already running
# You want to queue-up another one to run only if previous one succeeds
# While previous command is running, type "last && my new command"
# Use cases:
# - Run git push after git commit with pre commit hooks
# - Run notify if previous command succeeds. Can also use || to provide the
#   failure case
good() {
  return $?
}
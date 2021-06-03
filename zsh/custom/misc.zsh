### basic
alias ls="ls -G1"
alias ll="ls -GahlFT%"
alias l="python3 ~/site/python/dir_explorer/dir_explorer/list_files.py"

### cd && l/ls
function cl() {
  DIR="$*"
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME
  fi
  builtin cd "${DIR}" && l
}
function cls() {
  DIR="$*"
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME
  fi
  builtin cd "${DIR}" && ls
}

### one line servers
alias python_server="sudo python3 -m http.server 80"

### shortcuts
alias v="vim"
alias p="python"

# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

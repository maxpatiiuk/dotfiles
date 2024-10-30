### basic
alias ls="ls -G1"
alias ll="ls -GahlFT%"
alias l="python3 ~/site/python/dir-explorer/dir_explorer/list_files.py"

### cd && l/ls
function cl() {
  DIR="$*"
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME
  fi
  builtin cd "${DIR}" && l
}
compdef cl=cd

### one line servers
alias python_server="python3 -m http.server 8080"

### shortcuts
alias v="nvim"
alias neovim="nvim"
alias vim="nvim"
alias p="python"
alias n="node"

# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
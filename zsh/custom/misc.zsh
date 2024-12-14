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
alias p="python3"
alias n="node"
alias m="less"
alias vimdiff="nvim -d"

# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Colored man pages
# See https://unix.stackexchange.com/questions/119/colors-in-man-pages
export LESS_TERMCAP_mb=$'\e[1;34m'     # begin bold (blue fg)
export LESS_TERMCAP_md=$'\e[1;31m'     # begin blink (red fg)
export LESS_TERMCAP_so=$'\e[01;43;34m' # begin reverse video (yellow fg, blue bg)
export LESS_TERMCAP_us=$'\e[01;32m'    # begin underline (green fg)
export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # reset underline

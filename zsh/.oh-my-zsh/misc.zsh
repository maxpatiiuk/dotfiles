### Path
export PATH="/Users/mambo/.local/bin:$PATH"


### basic
alias ls="ls -G1"
alias l="ls -GahlFT%"



### cd && l/ls
function cl {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && l
}
function cls {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && ls
}



### one line servers
#alias php_server="sudo php -S localhost:80"
alias python_server="sudo python3 -m http.server 80"



### shortcuts
alias v="mvim -v"
alias pip="pip3"
alias p="python3"



# make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

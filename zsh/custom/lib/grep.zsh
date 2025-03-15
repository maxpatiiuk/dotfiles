alias grep='ggrep -E --color=auto --exclude-dir={.git,node_modules}'
alias fgrep='ggrep -F --color=auto --exclude-dir={.git,node_modules}'
function gred() {
  ggrep -rE --exclude-dir={.git,node_modules} --color=auto "$@" .
}
compdef _grep gred

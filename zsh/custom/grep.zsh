alias grep='ggrep -E --color=auto --exclude-dir={.git,node_modules,dist}'
alias fgrep='ggrep -F --color=auto --exclude-dir={.git,node_modules,dist}'
function gred() {
  ggrep -rE --exclude-dir={.git,node_modules,dist} --color=auto "$@" .
}
compdef _grep gred
function fgred() {
  ggrep -rF --exclude-dir={.git,node_modules,dist} --color=auto "$@" .
}
compdef _grep fgred

unalias ggrep 2>/dev/null

function ggrep() {
  local -a exclude_dirs
  local cwd="/${PWD:A}/"
  local dir

  if [[ "$cwd" != *"/.git/"* && "$cwd" != *"/node_modules/"* && "$cwd" != *"/dist/"* ]]; then
    for dir in .git node_modules dist; do
      exclude_dirs+=("--exclude-dir=$dir")
    done
  fi

  command ggrep --color=auto "${exclude_dirs[@]}" "$@"
}
alias grep='ggrep -E'
alias fgrep='ggrep -F'
function gred() {
  ggrep -rE "$@" .
}
compdef _grep gred
function fgred() {
  ggrep -rF "$@" .
}
compdef _grep fgred

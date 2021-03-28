# open current dir in finder
alias finder="open_command $PWD"

# show currently open finder dir
function pwf() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

# copy currently opened finder dir
function cdf() {
  cd "$(pwf)"
}

# preview file
function preview() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}


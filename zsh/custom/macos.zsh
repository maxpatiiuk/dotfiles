# show currently open finder dir
function fpwd() {
  osascript 2> /dev/null << EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

# copy currently opened finder dir
function fcd() {
  cd "$(fpwd)"
}

# preview file
function preview() {
  (($# > 0)) && qlmanage -p $* &> /dev/null &
}

# Tip: to open file in finder, run `open file`

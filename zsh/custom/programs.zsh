# Detailed documentation for some of these tools can be found here:
# https://github.com/maxxxxxdlp/code_share/tree/main/Python/

# Open the current repository or one of it's files/directories in GitHub
# on the current or provided branch
# OR open local file/directory based on GitHub URL
g() {
  output=`python3 ~/site/git/code_share/Python/github/github.py $@`
  if [[ "${output}" =~ "^cd " ]]; then
    # Running in Github URL to CLI mode
    eval ${output}
  else
    # Running in CLI to GitHub mode
    echo ${output}
  fi
}

# Curses-based CLI file explorer
f() {
  script_dir="${HOME}/site/python/dir_explorer/dir_explorer"

  # Create a temp file
  export tempfile="/tmp/list_view_$RANDOM"

  # Call the python script
  "${script_dir}/../venv/bin/python3" "${script_dir}/list_view.py" "$@"

  # Capture the output
  if [[ -f "$tempfile" ]]; then
    OUTPUT=($(cat $tempfile))
    # Clean up the temp file
    rm $tempfile
    unset tempfile

  else
    return 0
  fi

  echo "${OUTPUT[1]}/${OUTPUT[2]}"
  cd "${OUTPUT[1]}"

  l

  # If script returned a file name
  if [[ -f "${OUTPUT[1]}/${OUTPUT[2]}" ]]; then
    # Open the file in the default editor
    eval "${EDITOR:-vi}" "${OUTPUT[2]}"
  fi

}

export BROWSE_FILES='f';
export LIST_FILES='l';

# Play a notification sound. Useful when chained at the end of another
# program
alias notify="afplay /System/Library/Sounds/Funk.aiff &>/dev/null &"

# Run a dockerized youtube-dl with some default parameters
# Also, can be called like `yt <URL> && notify` to receive a
# completion notification
alias yt='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias yta='yt -f "bestaudio[ext=m4a]"'
alias t='npm run test'

# Find the `.idea/` directory among parent directories and open that
# project in PyCharm
pycharm() {
  open -na "PyCharm.app" --args $(python3 ~/site/git/code_share/Python/finder/finder.py .idea/ || echo "") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in PhpStorm
phpstorm() {
  open -na "PhpStorm.app" --args $(python3 ~/site/git/code_share/Python/finder/finder.py .idea/ || echo "") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in IntelliJ
intellij() {
  open -na "IntelliJ IDEA Ultimate.app" --args $(python3 ~/site/git/code_share/Python/finder/finder.py .idea/ || echo "") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in CLion
clion() {
  open -na "CLion.app" --args $(python3 ~/site/git/code_share/Python/finder/finder.py .idea/ || echo "") $@
}

alias mariadb="docker run \
  -p 127.0.0.1:3306:3306 \
  -v test-db:/var/lib/mysql \
  -v ${HOME}/Downloads/:/sql/ \
  -e MARIADB_ROOT_PASSWORD=root \
  --name test \
  --rm \
  mariadb"

alias tts="/Users/maxpatiiuk/site/javascript/tts-reader/node_modules/.bin/ts-node-esm /Users/maxpatiiuk/site/javascript/tts-reader/src/run.ts --input "

alias openconnect="sudo openconnect \
  --user=m001p596 \
  --authgroup=Default \
  https://kuanywhere.ku.edu"

ovpn() {
  sudo /usr/local/opt/openvpn/sbin/openvpn --config "${HOME}/Documents/ovpn/$1"
}
# Define autocomplete
_ovpn() {
  reply=($( (cd ~/Documents/ovpn/ && ls *.ovpn)))
}
compctl -K _ovpn ovpn

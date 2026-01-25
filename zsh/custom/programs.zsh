# Detailed documentation for some of these tools can be found here:
# https://github.com/maxpatiiuk/code0share/tree/main/Python/

# Open the current repository or one of it's files/directories in GitHub
# on the current or provided branch
# OR open local file/directory based on GitHub URL
# Documentation: https://github.com/maxpatiiuk/github-resolver
gu() {
  local dir=~/s/javascript/github-resolver
  local output=$(node "${dir}/dist/main.js" $@)
  if [[ "${output}" =~ "^cd " ]]; then
    eval ${output}
  else
    echo "${output}"
  fi
}
alias guu='gu $(git symbolic-ref refs/remotes/origin/HEAD --short)'

x() {
  command=$(node ~/s/git/code-share/javascript/projects/npm-run/index.js "$@")
  echo "> $command"
  eval $command
}
alias xi="x --inspect"
alias xiw="x --inspect-wait"
alias xib="x --inspect-brk"
alias xb="x build"
alias xba="x build:all"
alias xbd="x build-dev"
alias xs="x start"
alias xt="x test"
# test debug
alias xtd="x t-d"
# test update or test unit
alias xtu="x t-u"
# test watch
alias xtw="x t-w"
# dev or debug
alias xd="x d"
alias xw="x watch"
alias xv="x vite"
alias xvb="x vite build"
alias xivb="xi vite build"
alias xvt="x vitest"
alias tc="x tsc"
alias tx="x tsx"
alias txi="x tsx --inspect"
alias txib="x tsx --inspect-brk"

# Curses-based CLI file explorer
# Documentation: https://github.com/maxpatiiuk/dir-explorer
f() {
  script_dir="${HOME}/s/python/dir-explorer/dir_explorer"

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

# Play a notification sound. Useful when chained at the end of another
# program
alias notify="afplay /System/Library/Sounds/Funk.aiff &>/dev/null &"

# Tip: call it like `yt <URL> && notify` to receive a completion notification
#
# Call with "--batch-file" to batch download multiple
alias yt='noglob yt-dlp --no-playlist --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias yta='noglob yt-dlp --no-playlist --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction -f "bestaudio[acodec!=opus]/bestaudio/best" --extract-audio --audio-format m4a --audio-quality 0'
alias ch='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome '
alias chb='/Applications/Google\ Chrome\ Beta.app/Contents/MacOS/Google\ Chrome\ Beta '
alias r='cargo'

alias y='yarn'

# Make rm safer. See:
# https://github.com/sindresorhus/guides/blob/main/how-not-to-rm-yourself.md#safeguard-rm
alias rm="/opt/homebrew/bin/grm -I"
# Prompt before overwriting existing files
alias cp='cp -i'
alias cpd='cp -r'
alias mv='mv -i'
alias mvd='mv -f'

alias rmrf='rm -rf'

# Find the `.idea/` directory among parent directories and open that
# project in PyCharm
# pycharm() {
# open -na "PyCharm.app" --args $(node ~/s/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
# }

# Find the `.idea/` directory among parent directories and open that
# project in WebStorm
# webstorm() {
# open -na "WebStorm.app" --args $(node ~/s/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
# }

# Find the `.idea/` directory among parent directories and open that
# project in PhpStorm
# phpstorm() {
# open -na "PhpStorm.app" --args $(node ~/s/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
# }

# Find the `.idea/` directory among parent directories and open that
# project in IntelliJ
# intellij() {
# open -na "IntelliJ IDEA Ultimate.app" --args $(node ~/s/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
# }

# Find the `.idea/` directory among parent directories and open that
# project in CLion
# clion() {
# open -na "CLion.app" --args $(node ~/s/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
# }

# Find the `.vscode/` directory among parent directories and open that
# project in VS Code
c() {
  if [ $# -eq 0 ]; then
    local dir=$(node ~/s/git/code-share/javascript/projects/finder/finder.js .vscode || echo "./")

    if [[ "$dir" == "$HOME" ]]; then
      dir="./"
    fi

    if [[ "$dir" == "./" ]]; then
      dir=$(node ~/s/git/code-share/javascript/projects/finder/finder.js .git || echo "./")
    fi

    if [[ "$dir" == "$HOME" ]]; then
      dir="./"
    fi
    # Hoping to workaround https://github.com/microsoft/vscode/issues/107016
    # The --disable-render-accessibility flag seems to not fix the issue
    # completely, but makes things better
    code $dir --disable-renderer-accessibility
  else
    code $@
  fi
}
compdef c=code

ce() {
  c $@ && exit
}

# alias mariadb="docker run \
# -p 127.0.0.1:3306:3306 \
# -v test-db:/var/lib/mysql \
# -v ${HOME}/Downloads/:/sql/ \
# -e MARIADB_ROOT_PASSWORD=root \
# --name test \
# --rm \
# mariadb"

tts() {
  npx text-hoarder process --output-dir text-hoarder-processed --force-output-dir --glob $@
  for f in text-hoarder-processed/*.txt; do
    say -r 250 -o "$f.flac" --progress "$(cat $f)"
    rm "$f"
  done
}

alias tts-nn="~/s/python/tts-nn/venv/bin/python3 ~/s/python/tts-nn/kokoro-onnx/examples/tool.py"

export NODE_COMPILE_CACHE=/tmp/node-compile-cache

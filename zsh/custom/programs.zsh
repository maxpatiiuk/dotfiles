# Detailed documentation for some of these tools can be found here:
# https://github.com/maxpatiiuk/code0share/tree/main/Python/

# Open the current repository or one of it's files/directories in GitHub
# on the current or provided branch
# OR open local file/directory based on GitHub URL
# Documentation: https://github.com/maxpatiiuk/github-resolver
gu() {
  local dir=~/site/javascript/github-resolver
  local output=$(node "${dir}/dist/main.js" $@)
  if [[ "${output}" =~ "^cd " ]]; then
    eval ${output}
  else
    echo "${output}"
  fi
}

x() {
  command=$(node ~/site/git/code-share/javascript/projects/npm-run "$@")
  echo "> $command"
  eval $command
}

# Curses-based CLI file explorer
# Documentation: https://github.com/maxpatiiuk/dir-explorer
f() {
  script_dir="${HOME}/site/python/dir-explorer/dir_explorer"

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

export BROWSE_FILES='f'
export LIST_FILES='l'

# Play a notification sound. Useful when chained at the end of another
# program
alias notify="afplay /System/Library/Sounds/Funk.aiff &>/dev/null &"

# Run a dockerized youtube-dl with some default parameters
# Also, can be called like `yt <URL> && notify` to receive a
# completion notification
#
# Call with "--batch-file" to batch download multiple
alias yt='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4" --no-playlist --sponsorblock-remove sponsor,intro,outro,selfpromo,interaction'
alias yta='yt -f "bestaudio[ext=m4a]"'
alias t='npm run test'
alias rr='npm run '

alias y='yarn'
alias grep='ggrep --color'

# Make rm safer. See:
# https://github.com/sindresorhus/guides/blob/main/how-not-to-rm-yourself.md#safeguard-rm
alias rm="/opt/homebrew/bin/grm -I"

# Find the `.idea/` directory among parent directories and open that
# project in PyCharm
pycharm() {
  open -na "PyCharm.app" --args $(node ~/site/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in WebStorm
webstorm() {
  open -na "WebStorm.app" --args $(node ~/site/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in PhpStorm
phpstorm() {
  open -na "PhpStorm.app" --args $(node ~/site/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in IntelliJ
intellij() {
  open -na "IntelliJ IDEA Ultimate.app" --args $(node ~/site/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
}

# Find the `.idea/` directory among parent directories and open that
# project in CLion
clion() {
  open -na "CLion.app" --args $(node ~/site/git/code-share/javascript/projects/finder/finder.js .idea || echo "./") $@
}

# Find the `.vscode/` directory among parent directories and open that
# project in VS Code
c () {
	if [ $# -eq 0 ]
	then
		local dir=$(node ~/site/git/code-share/javascript/projects/finder/finder.js .vscode || echo "./")

		if [[ "$dir" == "$HOME" ]]
		then
			dir="./"
		fi

		if [[ "$dir" == "./" ]]
		then
		  dir=$(node ~/site/git/code-share/javascript/projects/finder/finder.js .git || echo "./")
		fi

		if [[ "$dir" == "$HOME" ]]
		then
			dir="./"
		fi
		code $dir
	else
		code $@
	fi
}
compdef c=code

alias mariadb="docker run \
  -p 127.0.0.1:3306:3306 \
  -v test-db:/var/lib/mysql \
  -v ${HOME}/Downloads/:/sql/ \
  -e MARIADB_ROOT_PASSWORD=root \
  --name test \
  --rm \
  mariadb"

# Unfortunately, ts-node relies on current working directory for
# resolving tsconfig.json, so must be executed from that location.
#
# If using "npx ts-node" syntax, can provide a custom location, but
# can't use "npx ts-node" syntax because of a bug when using Node.js 20
# (https://github.com/TypeStrong/ts-node/issues/1997)
#
# A possible hack until that is fixed would be for this function to
# temporary copy tsconfig.json into the current directory
tts() {
  (cd node --loader ts-node/esm/transpile-only  && node --loader ./node_modules/ts-node/esm/transpile-only.mjs ./src/run.ts --split 32000 --input $@)
}
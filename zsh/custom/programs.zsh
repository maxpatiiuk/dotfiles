# Detailed documentation for some of these tools can be found here:
# https://github.com/maxxxxxdlp/code_share/tree/main/Python/

# Copy to clipboard from pipe or echo current clipboard's value
alias clipboard="python3 ~/site/git/code_share/Python/clipboard/clip_board.py"

# Run text to speech on piped text or on the file provided as first
# argument or on the default file
alias tts="~/site/python/python_tts/venv/bin/python ~/site/python/python_tts/run.py"

# Open the current repository or one of it's files/directories in git
# on the current or provided branch
alias g="python3 ~/site/git/code_share/Python/github/github.py"

# `f` because `cc`, `dc`, `dd` and `ss` is already taken :)
alias f="/bin/zsh ~/site/python/dir_explorer/dir_explorer/list_view"

# Play a notification sound. Useful when chained at the end of another
# program
alias notify="afplay /System/Library/Sounds/Funk.aiff"

# Run a dockerized youtube-dl with some default parameters
# Also, can be called like `yt <URL> && notify` to received a
# completion notification
alias yt='docker run \
  --rm -i \
  -e PGID=$(id -g) \
  -e PUID=$(id -u) \
  -v "$(pwd)":/workdir:rw \
  mikenye/youtube-dl \
  -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

# Run a dockerized version of ffmpeg
alias ffmpeg='docker run \
  --rm
-v $(pwd):$(pwd)
-w $(pwd)
jrottenberg/ffmpeg:scratch'

# Find the `.idea/` directory among parent dirs and open that
# project in PyCharm
pycharm(){
  open -na "PyCharm.app" --args `python3 ~/site/git/code_share/Python/finder/finder.py .idea/ || echo ""` $@
}

alias brewup='brew update; \
  brew upgrade; \
  brew prune; \
  brew cleanup; \
  brew doctor'

alias openconnect="sudo openconnect \
  --user=m001p596 \
  --authgroup=Default \
  --servercert pin-sha256:vOh3aObKrNH9gFqFNWCmj/Km0Z5v8WvLzr4AAtHLjHQ= \
  https://kuanywhere.ku.edu"

ovpn(){
  sudo /usr/local/opt/openvpn/sbin/openvpn --config "${HOME}/Documents/ovpn/$1"
}
# Define autocomplete
_ovpn(){
  reply=(`(cd ~/Documents/ovpn/ && ls *.ovpn)`);
}
compctl -K _ovpn ovpn

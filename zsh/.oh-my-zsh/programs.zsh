alias clipboard="python3 ~/site/git/code_share/Python/clipboard/clip_board.py"
alias tts="python3 ~/site/python/tts/run.py"
alias g="python3 ~/site/git/code_share/Python/github/github.py"
# `f` because `cc`, `dc`, `dd` and `ss` is already taken :)
alias f="python3 ~/site/git/dir-explorer/dir-explorer/main.py"
alias notify="afplay /System/Library/Sounds/Funk.aiff"
alias yt='docker run \
  --rm -i \
  -e PGID=$(id -g) \
  -e PUID=$(id -u) \
  -v "$(pwd)":/workdir:rw \
  mikenye/youtube-dl \
  -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'

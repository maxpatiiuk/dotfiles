# Open container's shell. Available shells are found automatically
dsh(){
  for shell in \
    "script -q -c /bin/bash /dev/null" \
    "script -q -c /bin/sh /dev/null" \
    "script -q -c /bin/zsh /dev/null" \
    "script -q -c /bin/ash /dev/null" \
    "/bin/bash/" \
    "/bin/sh" \
    "/bin/zsh" \
    "/bin/ash"
  do
    echo $shell
    docker exec -it "$1" env TERM=xterm-256color $shell
    if [ $? -eq 0 ]; then
      echo "1"
      break
    fi
  done
}

# A colorful output for docker ps command
ds_format='table {{"\033[35m"}}{{.ID}} {{if eq .State "exited"}}{{"\033[31m"}}{{else}}{{"\033[32m"}}{{end}}{{.State}}\t{{"\033[36m"}}{{.Names}}\t{{"\033[34m"}}{{.Image}}\t{{"\033[33m"}}{{.RunningFor}}\t{{"\033[32m"}}{{.Size}}{{"\033[0m"}}'
alias ds='docker ps --format "${ds_format}"'
alias dsa='docker ps -a --format "${ds_format}"'

# Run the containers with the watcher script
# More info:
# https://github.com/specify/specify_tools/tree/main/docker_container
dcu(){
  scripts_location="~/site/git/specify_tools/docker_container/"
  compose_location=`python3 ~/site/git/code_share/Python/finder/finder.py docker-compose.yml`
  if [ $? -ne 0 ]; then
    echo "Unable to find 'docker-compose.yml"
    return 1
  fi
  cd $compose_location
  nohup /bin/zsh -c '${scripts_location}venv/bin/python ${scripts_location}watch.py' &
  docker compose up $@
  cd -
}

alias dl="docker logs -f"
alias dcl="docker compose logs -f"

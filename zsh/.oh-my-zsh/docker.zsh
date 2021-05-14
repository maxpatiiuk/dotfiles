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
ds_format='table {{"\033[35m"}}{{.ID}} {{if eq .State "exited"}}{{"\033[31m"}}{{else}}{{"\033[32m"}}{{end}}{{.State}}\t{{"\033[36m"}}{{.Names}}\t{{"\033[34m"}}{{.Image}}\t{{"\033[33m"}}{{.RunningFor}}\t{{"\033[32m"}}{{.Size}}{{"\033[0m"}}'
alias ds='docker ps --format "${ds_format}"'
alias dsa='docker ps -a --format "${ds_format}"'
dcu(){
 python3 ~/site/git/specify_tools/docker_container/up.py $@ | /bin/zsh
}
alias dl="docker logs -f"
alias dcl="docker compose logs -f"

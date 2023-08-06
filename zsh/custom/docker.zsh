# Open container's shell. Available shells are found automatically
dsh() {
  for shell in \
    "script -q -c /bin/bash /dev/null" \
    "script -q -c /bin/sh /dev/null" \
    "/bin/bash/" \
    "/bin/sh"; do
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

ZSHRC_LOCATION=$(dirname "$0")
alias dcu="${ZSHRC_LOCATION}/dcu.sh "

alias dl="docker logs -f"
alias dcl="docker compose logs -f"

alias dd="DOCKER_CONTEXT=maxxxxxdlp-pc "

# Run Alpine Docker container with node
alias dn="docker run --name test --rm -it -p 80:80 node:17.2.0-alpine3.14 /bin/sh"

alias sync_client='docker run --rm --init -it -u $(id -u):$(id -g) -v $(pwd):/data \
  -p 49172:49172 \
  quay.io/stephenh/mirror client \
  --local-root /data \
  --remote-root /data \
  --host my.moon \
  --include "./seed-database" --exclude "./idea" --exclude "nohup.out"'
alias sync_server='docker run \
  --rm --init -it -u $(id -u):$(id -g) -v $(pwd):/data -p 49172:49172 \
  quay.io/stephenh/mirror server'

alias dr="docker container restart"
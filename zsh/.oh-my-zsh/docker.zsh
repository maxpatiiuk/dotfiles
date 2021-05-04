dsh(){
  docker exec -it "$1" env TERM=xterm-256color script -q -c "/bin/bash" /dev/null
}
alias ds="docker ps"
alias dsa="docker ps -a"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dl="docker logs -f"
alias dcl="docker-compose logs -f"

# Run the containers with the watcher script
# More info:
# https://github.com/specify/specify_tools/tree/main/docker_container
scripts_location="~/site/git/specify_tools/docker_container/"
compose_location=$(node ~/site/git/code_share/javascript/projects/finder/finder.js docker-compose.yml)
if [ $? -ne 0 ]; then
  echo "Unable to find 'docker-compose.yml"
  return 1
fi
cd $compose_location
echo "" > nohup.out
watcher=(bash -c "${scripts_location}venv/bin/python ${scripts_location}watch.py")
nohup $watcher &
docker compose up $@
cd -
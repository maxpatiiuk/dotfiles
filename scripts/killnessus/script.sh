#!/bin/zsh

# tenable nessus starts dozen of `find` process that eat 100% CPU.
# Get a list of all PIDs named 'find' owned by 'root':
pgrep -u root -x find | while read -r pid; do
    
    # Filter the list to processed owned by perl
    parent_comm=$(ps -p $(ps -p $pid -o ppid=) -o comm= 2>/dev/null)
    if [[ "$parent_comm" == *"perl"* ]]; then
        # Kill them (needs to run as sudo)
        kill -9 "$pid" 2>/dev/null
    fi
done
alias dstop=dstop
alias dremove=dremove
alias dexec=dexec
alias dps=dps

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
dremove() { docker rm $(docker ps -a -q); }

# Bash into running container
dexec() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Get container process pretty
dps() { docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"; }

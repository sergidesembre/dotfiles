#!/usr/bin/env bash

YELLOW="\e[33m"
BLUE="\e[34m"
ENDCOLOR="\e[0m"

for branch in $(git for-each-ref --format='%(refname:short)' refs/heads | grep -v 'master\|main\|origin'); do
  read -p "$(echo -e "Remove ${YELLOW}`git show --format="%ci %cr" $branch | head -n 1` ${BLUE}'$branch'${ENDCOLOR}?:")" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    git branch -D $branch
  fi
done
#!/bin/bash

read -p "Reset EVERYTHING before start ? [Y/n]: " -n 1 -r YN
if [[ $YN =~ ^[Yy]$ || $YN = "" ]] ; then
  printf "\n"
  docker-compose up \
  --detach \
  --build \
  --remove-orphans \
  --force-recreate \
  --renew-anon-volumes \
  --always-recreate-deps

else
  printf "\n"
  docker-compose up \
    --build \
    --detach
fi
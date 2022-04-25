#!/bin/bash

# set current docker-compose file
cp deploy/docker-compose.yml docker-compose.yml

# if actual .env exist, ask for saving it
if [ -f .env ]; then
  printf "\n"
  mv .env config/.env.old
fi

# replace it anyway
cp config/.env.local .env

#!/bin/bash

# set current docker-compose file
cp deploy/docker-compose.yml docker-compose.yml

# if actual .env exist, ask for saving it
if [ -f .env ]; then
  read -p "Save old .env file ? [Y/n]: " -n 1 -r YN
  if [[ $YN =~ ^[Yy]$ || $YN = "" ]] ; then
    mv .env .env.old
  fi
fi

# replace it anyway
cp .env.sample .env

go mod init
go mod
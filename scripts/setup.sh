#!/bin/bash

cp deployments/docker-compose.yml docker-compose.yml

if [ -f .env ]; then
echo "oui"
  read -p "Replace .env file ? [Y/n]: " -n 1 -r YN
  if [[ $YN =~ ^[Yy]$ || $YN = "" ]] ; then
    mv .env .env.old
  fi
fi
cp .env.sample .env
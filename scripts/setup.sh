#!/bin/bash

if [ -f .env ]; then
  cp deployments/docker-compose.yaml docker-compose.yaml
  
  read -p "Replace .env file ? [Y/n]: " -n 1 -r YN
  if [[ $YN =~ ^[Yy]$ ]] ; then
    mv .env .env.old
  fi
  cp .env.sample .env
fi
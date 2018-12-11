#!/bin/bash

chown 1000:1000 `pwd`/volumes

docker run --name gp-gitea -v `pwd`/volumes:/data -p 3000:3000 -p 2222:22 -d gitea/gitea:1.6
# docker-compose up -d
#!/bin/bash

# get current path
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
if [ "$DIR" != "$RDIR" ]; then
  echo "DIR '$RDIR' resolves to '$DIR'"
fi
echo "DIR is '$DIR'"

# set the external docker volume
VOLUME=$DIR/volume
echo docker external volume: '$VOLUME'

# set write privileges when execute with docker
chown 1000:1000 -R $VOLUME
chmod 777 -R $VOLUME

# create the docker container
# docker run --name gp-nginx -p 3000:3000 -p 2222:22 -v $VOLUME/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
# docker run --name gp-nginx -v $VOLUME:/etc/nginx -d nginx:1.15-alpine
docker run --name gp-nginx -p 80:80 -d nginx:1.15-alpine

# docker-compose up -d
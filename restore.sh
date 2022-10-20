#!/bin/sh

BACKUP_FILE="$1"
VOLUME_NAME="$2"

docker run --rm \
    -v $VOLUME_NAME:/volume \
    -v `pwd`:/backup \
    ubuntu \
    tar xzvf /backup/$BACKUP_FILE -C /volume --strip 1

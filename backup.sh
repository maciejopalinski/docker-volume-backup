#!/bin/sh

VOLUME_NAME="$1"
BACKUP_FILE="$2"

docker run --rm \
    -v $VOLUME_NAME:/volume \
    -v `pwd`:/backup \
    ubuntu \
    tar czvf /backup/$BACKUP_FILE /volume

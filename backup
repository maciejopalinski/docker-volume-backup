#!/bin/bash

VOLUME_NAME="$1"
BACKUP_FILE="$2"

if [[ -z "$VOLUME_NAME" ]]; then
    echo "Error: Please provide docker volume name"
    exit 1
fi

if [[ -z "$(docker volume ls -q | grep -x "$VOLUME_NAME")" ]]; then
    echo "Error: Docker volume not found"
    exit 1
fi

if [[ -z "$BACKUP_FILE" ]]; then
    BACKUP_FILE="$VOLUME_NAME.tar.gz"
fi

docker run --rm \
    -v $VOLUME_NAME:/volume \
    -v $(pwd):/backup \
    ubuntu \
    tar czvf /backup/$BACKUP_FILE /volume

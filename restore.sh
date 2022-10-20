#!/bin/bash

BACKUP_FILE="$1"
VOLUME_NAME="$2"

if [[ -z "$BACKUP_FILE" ]]; then
    echo "Error: Please provide backup file name"
    exit 1
fi

if [[ ! -f "$BACKUP_FILE" ]]; then
    echo "Error: File not found"
    exit 1
fi

if [[ -z "$VOLUME_NAME" ]]; then
    VOLUME_NAME=${BACKUP_FILE%.tar.gz}
fi

docker run --rm \
    -v $VOLUME_NAME:/volume \
    -v `pwd`:/backup \
    ubuntu \
    tar xzvf /backup/$BACKUP_FILE -C /volume --strip 1

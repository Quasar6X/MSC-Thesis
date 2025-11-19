#!/bin/sh

readonly WORK_DIR="${1:-$(pwd)}"
readonly MOUNT_POINT='/workspace'
readonly USER='ubuntu'

docker run --rm --entrypoint="" -v "$WORK_DIR:$MOUNT_POINT" -w $MOUNT_POINT -u $USER ghcr.io/quasar6x/thesis-builder:latest latexmk

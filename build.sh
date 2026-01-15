#!/bin/sh -l

# Constants
readonly MOUNT_POINT='/workspace'

usage() { echo "Usage: $0 -u <DOCKER_USERNAME> -w <WORK_DIR> [-h]" 1>&2; exit 1; }

unset -v DOCKER_USERNAME WORK_DIR
while getopts ":u:w:h" opt; do
    case $opt in
        u)
        DOCKER_USERNAME="$OPTARG"
        ;;
        w)
        WORK_DIR="${OPTARG:-$(pwd)}"
        ;;
        h|*)
        usage
        ;;
    esac
done

# Set WORK_DIR if it was not sent on the CLI
WORK_DIR="${WORK_DIR:-$(pwd)}"

docker run --rm \
    -v "$WORK_DIR:$MOUNT_POINT" \
    -w "$MOUNT_POINT" \
    -u "$DOCKER_USERNAME" \
    ghcr.io/quasar6x/thesis-builder:latest \
    /bin/bash -c "\
    latexmk -jobname=Szucs_Daniel_BSY9BQ_MSc_Thesis src/thesis.tex; \
    latexmk -jobname=Szucs_Daniel_BSY9BQ_MSc_Thesis_Slides src/slides.tex"

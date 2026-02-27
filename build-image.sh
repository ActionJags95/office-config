#!/bin/bash

USER_NAME="$(id -un)"
USER_UID="$(id -g)"
USER_GID="$(getent group "$USER" | awk -F ":" '{print $3}')"

docker build --build-arg USER_NAME="$USER_NAME" --build-arg USER_UID="$USER_UID" --build-arg USER_GID="$USER_GID" -t myimage:latest .

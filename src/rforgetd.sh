#!/usr/bin/env bash

set -euo pipefail
shopt -s extglob

USAGE="Usage: $0 ENVIRONMENT [extra restic args]"

if [[ "$#" -lt 1 ]]; then
    echo "$USAGE" 1>&2
    exit 1
fi

if [[ ! -v "XDG_CONFIG_HOME" ]]; then
    config_home="$HOME/.config"
else
    config_home="$XDG_CONFIG_HOME"
fi
env_file="$config_home/rbackupd/$1-env.sh"

if [[ ! -f "$env_file" ]]; then
    echo "Environment file \"$env_file\" not found."
    exit 2
fi
source "$env_file"

restic forget \
    --keep-last 48 \
    --keep-daily 180 \
    --keep-monthly "unlimited" \
    --prune \
    "${@:2}"

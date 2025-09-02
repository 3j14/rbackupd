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
files_file="$config_home/rbackupd/$1.files"

if [[ ! -f "$env_file" ]]; then
    echo "Environment file \"$env_file\" not found."
    exit 2
fi
if [[ ! -f "$files_file" ]]; then
    echo "File \"$files_file\" not found."
    exit 2
fi
source "$env_file"
if [[ -v "hooks_pre" && "${#hooks_pre[@]}" -gt 0 ]]; then
    for hook in "${hooks_pre[@]}"; do
        if ! declare -F "$hook" > /dev/null; then
            printf "Pre-hook '%s' is not a function. No hooks were executed." "$hook" 1>&2
        fi
    done
fi
if [[ -v "hooks_post" && "${#hooks_post[@]}" -gt 0 ]]; then
    for hook in "${hooks_post[@]}"; do
        if ! declare -F "$hook" > /dev/null; then
            printf "Post-hook '%s' is not a function. No hooks were executed." "$hook" 1>&2
        fi
    done
fi

if [[ -v "hooks_pre" && "${#hooks_pre[@]}" -gt 0 ]]; then
    for hook in "${hooks_pre[@]}"; do
        "$hook"
    done
fi
set +e
restic backup \
    --exclude-caches \
    --files-from "$files_file" \
    --exclude-file "$HOME/.config/rbackupd/exclude.files" \
    --one-file-system \
    "${@:2}"
res="$?"
set -e
if [[ -v "hooks_post" && "${#hooks_post[@]}" -gt 0 ]]; then
    for hook in "${hooks_post[@]}"; do
        "$hook" "$res"
    done
fi
exit "$res"

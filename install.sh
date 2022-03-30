#!/usr/bin/env bash

if ! command -v stow $> /dev/null
then
    echo "command not found: stow"
    echo "bootstrapping gnu stow..."
    sudo apt-get install stow
fi

if [[ -z "${STOWDIRS}" ]]; then
    echo "STOWDIRS environment variable is undefined."
    exit 1
else
    dotfile_dirs="${STOWDIRS}"
fi

for dir in $dotfile_dirs
do
    echo "stow $dir"
    stow -D $dir
    stow $dir
done

#!/usr/bin/env bash

if ! command -v stow $> /dev/null
then
    echo "command not found: stow"
    exit 1
fi

if [[ -z "${STOWDIRS}" ]]; then
    echo "STOWDIRS environment variable is undefined."
    exit 1
else
    dotfile_dirs="${STOWDIRS}"
fi

for dir in $dotfile_dirs
do
    cd ${DOTFILES}
    echo "stow -D $dir"
    stow -D $dir
done


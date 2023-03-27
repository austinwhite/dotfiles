#!/usr/bin/env bash

if ! command -v stow $> /dev/null
then
    echo "command not found: stow"
    echo "bootstrapping gnu stow..."
    sudo pacman -S stow
fi

if [[ -z "${DOTFILES}" ]]; then
    echo "DOTFILES environment variable does not exist."
    echo "setting DOTFILES to \$HOME/.dotfiles"
    export DOTFILES="$HOME/.dotfiles"
fi

dotfile_dirs=`cd ${DOTFILES} && head ./stow-dirs.txt` 

for dir in $dotfile_dirs
do
    cd ${DOTFILES}
    echo "un-stowing: $dir"
    stow -D $dir
done


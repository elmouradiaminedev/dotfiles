#!/bin/bash

src=$(pwd)

cd $DOTFILES

# Perform a dry-run to identify files that cannot be linked
files=$(stow -n . 2>&1 | grep "existing target is neither a link nor a directory" | awk -F ":" '{print $2}')

for file in $files; do
    info "Cleaning up files for stow linking..."
    rm -rf "$HOME/$file"
done

stow .

if [ $? -eq 0 ]; then
    success "Stowing completed successfully."
else
    error "Stowing encountered an error."
    exit 1
fi

cd $src 

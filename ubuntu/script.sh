#!/bin/bash

echo "Configure Native Ubuntu..."

# Copy settings to home
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for file in $(find "${DIR}/" -name ".ubuntu.*");
do
    ln -sf $file ~/${file##*/}
done

chsh -s $(which zsh)

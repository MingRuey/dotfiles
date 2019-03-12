#!/bin/bash

echo "Configure Windows Subsystem for Linux(WSL)..."

# Copy settings to home
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
for file in $(find "${DIR}/" -name ".wsl.*");
do
    ln -sf $file ~/${file##*/}
done

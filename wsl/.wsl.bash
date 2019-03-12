#!/bin/bash

echo "Load WSL Bash settings"

if [ -t 1 ]; then
    exec zsh
fi

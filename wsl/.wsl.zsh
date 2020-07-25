#!/bin/bash

echo "Setting WSL Zsh settings"

# copy vimrc file for VsVim (vim emulator for Visual Studio)
WINUSERP=$(wslpath $(wslvar USERPROFILE))
find . -name ".wsl.vsvimrc" -exec cp {} $WINUSERP/_vsvimrc \;


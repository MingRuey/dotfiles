#!/bin/bash

echo "Setting WSL Zsh settings"

# copy vimrc file for VsVim (vim emulator for Visual Studio)
WINUSERP=$(wslpath $(wslvar USERPROFILE))
cp ./.wsl.vsvimrc $WINUSERP/_vsvimrc

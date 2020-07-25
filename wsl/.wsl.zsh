#!/bin/bash

echo "Setting WSL Zsh settings"

# copy vimrc file for VsVim (vim emulator for Visual Studio)
WINUSERP=$(wslpath $(wslvar USERPROFILE))
vsvimrc="$(dirname $(readlink -f $0))/.wsl.vsvimrc"
cp $vsvimrc $WINUSERP/_vsvimrc


#!/bin/bash

echo "Config WSL Zsh Settings (.wsl.zsh)"

# copy vimrc file for VsVim (vim emulator for Visual Studio)
WINUSERP=$(wslpath $(wslvar USERPROFILE))
vsvimrc="$(dirname $(readlink -f $0))/.wsl.vsvimrc"
cp $vsvimrc $WINUSERP/_vsvimrc

# source wsl specific local shortchuts
. "$(dirname $(readlink -f $0))/.apps"

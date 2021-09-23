#!/bin/bash

# copy vimrc file for VsVim (vim emulator for Visual Studio)
WINUSERP=$(wslpath $(wslvar USERPROFILE))
vsvimrc="$(dirname $(readlink -f $0))/.wsl.vsvimrc"
ideavimrc="$(dirname $(readlink -f $0))/.wsl.ideavimrc"
cp $vsvimrc $WINUSERP/_vsvimrc
cp $ideavimrc $WINUSERP/_ideavimrc
cp $ideavimrc ~/.ideavimrc

# source wsl specific local shortchuts
. "$(dirname $(readlink -f $0))/.apps"

echo "Config WSL Zsh Settings (.wsl.zsh)"

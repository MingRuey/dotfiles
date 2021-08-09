#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install fzf completiong
fzf_exec="fzf/install"
echo "Install completion tool fzf"
yes | $DIR/$fzf_exec

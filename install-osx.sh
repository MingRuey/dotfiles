#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# For some GNU compatibilities
brew install coreutils

# Install oh-my-zsh, autojump, xcilp
echo -n "Install oh-my-zsh"
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install coreutils
brew install autojump
brew install xclip
brew install task
brew install tmux

exec_install_scripts()
{
    for file in $(find "$1" -name "install*.sh");
    do
	echo "-- Bash ${file}"
	bash $file | sed 's/^/    /'
    done
}

link_all()
{
    for file in $(find "$1" -name ".*");
    do
	echo "-- Link ${file} to ~/${file##*/}"
	ln -sf $file ~/${file##*/}
    done
}

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASHDIR="/bash/"
TMUXDIR="/tmux/"
ZSHDIR="/zsh/"
GITDIR='/git/'
VIMDIR='/vim/'
COLORDIR="/color/"

for directory in $BASHDIR $TMUXDIR $ZSHDIR $VIMDIR $GITDIR $COLORDIR; do
    link_all "$BASE$directory"
done

# Detect System Type (ubuntu or wsl) and execute install scripts
if grep -q "[Mm]icrosoft" /proc/version; then
    SYSDIR="/wsl/"
else
    SYSDIR="/ubuntu/"
fi

for directory in $ZSHDIR $VIMDIR $GITDIR $SYSDIR; do
    exec_install_scripts "$BASE$directory"
done

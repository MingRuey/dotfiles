#!/bin/bash

AUTOLOAD="$HOME/.vim/autoload"
BUNDLE="$HOME/.vim/bundle"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# install autoload (only pathogen now)
if [[ -d $AUTOLOAD ]]
then
    echo "$AUTOLOAD exists, remove it"
    rm -r $AUTOLOAD
fi

echo -e "Copy $DIR/autoload into $HOME/.vim"
cp -r "$DIR/autoload" "$HOME/.vim"

# install bundle
if [[ -d "$BUNDLE" ]]
then
    echo "$BUNDLE exists, remove it."
    rm -r $BUNDLE
fi

echo -e "Copy $DIR/bundle into $HOME/.vim"
cp -r "$DIR/bundle" "$HOME/.vim"


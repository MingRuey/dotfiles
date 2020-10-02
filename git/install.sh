#!/bin/bash

GITTEMPDIR="$HOME/.git-template"
mkdir -p $GITTEMPDIR

# install hooks
if [[ -d "$GITTEMPDIR/hooks" ]]
then
    echo "$GITTEMPDIR/hooks exists, remove it."
    rm -r "$GITTEMPDIR/hooks"
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "Copy $DIR/hooks into $GITTEMPDIR"
cp -r "$DIR/hooks" $GITTEMPDIR
find "$DIR/hooks" -type f -exec chmod +x {} \;


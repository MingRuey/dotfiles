#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GITTEMPDIR="$HOME/.git-template"
mkdir -p $GITTEMPDIR

# install default template
if [[ -f "$GITTEMPDIR/HEAD" ]]
then
    echo "$GITTEMPDIR/HEAD exist, overwrite it."
    rm "$GITTEMPDIR/HEAD"
fi

cp "$DIR/HEAD" "$GITTEMPDIR"

# install hooks
if [[ -d "$GITTEMPDIR/hooks" ]]
then
    echo "$GITTEMPDIR/hooks exists, remove it."
    rm -r "$GITTEMPDIR/hooks"
fi

echo -e "Copy $DIR/hooks into $GITTEMPDIR"
cp -r "$DIR/hooks" $GITTEMPDIR
find "$DIR/hooks" -type f -exec chmod +x {} \;


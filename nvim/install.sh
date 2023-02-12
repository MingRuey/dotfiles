#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_BASE="$HOME/.config/nvim"
if [[ ! -d "$NVIM_BASE" ]]; then mkdir -p $NVIM_BASE; fi

#install bundle
BUNDLE="$NVIM_BASE/bundle/"
if [[ -d "$BUNDLE" ]]
then
    echo "$BUNDLE exists, remove it."
    rm -r $BUNDLE
fi
echo -e "Copy $DIR/bundle into $BUNDLE"
cp -r "$DIR/bundle" $BUNDLE

# install autoload (only pathogen now)
AUTOLOAD="$NVIM_BASE/autoload"
if [[ -d $AUTOLOAD ]]
then
    echo "$AUTOLOAD exists, remove it"
    rm -r $AUTOLOAD
fi

echo -e "Copy $DIR/autoload into $AUTOLOAD"
cp -r "$DIR/autoload" $AUTOLOAD

# link init.vim
LUA_INIT="$NVIM_BASE/init.lua"
LUA_PLUGINS="$NVIM_BASE/lua"
echo -e "Link $DIR/init.lua to $LUA_INIT"
ln -sf "$DIR/init.lua" $LUA_INIT
if [[ -d $LUA_PLUGINS ]]; then mkdir $LUA_PLUGINS; fi
echo -e "Link $DIR/plugins.lua to $LUA_PLUGINS/plugins.lua"
ln -sf "$DIR/plugins.lua" $LUA_PLUGINS/plugins.lua

# cp help script
BIN="$NVIM_BASE/bin"
if [[ -d "$BIN" ]]
then
    echo "$BIN exists, remove it."
    rm -r $BIN
fi

echo -e "Copy $DIR/bin into $BIN"
cp -r "$DIR/bin" $BIN
find $BIN -type f -exec chmod +x {} \;

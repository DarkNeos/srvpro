#!/bin/bash

git submodule update --init --recursive

cd ygopro

git submodule update --init --recursive

wget https://www.lua.org/ftp/lua-5.4.3.tar.gz && tar xf lua-5.4.3.tar.gz && mv lua-5.4.3 lua && cp premake/lua/* lua/

premake5 gmake --cc=clang --mac-arm
cd build
make config=release
cd ..

ln -s bin/release/ygopro ./
strip ygopro

cd ..

npm ci

mkdir config
cp data/default_config.json config/config.json

#!/bin/bash

git submodule update --init --recursive

cd ygopro

git submodule update --init --recursive

cp ../premake5 ./

wget -O - https://www.lua.org/ftp/lua-5.3.6.tar.gz | tar zfx -; cd lua-5.3.6; sudo make linux install; cd ..
mv lua-5.3.6 lua
cp ./premake/lua/premake5.lua ./lua

./premake5 gmake
cd build
make config=release
cd ..

ln -s bin/release/ygopro ./
strip ygopro

cd ..

npm ci

mkdir config
cp data/default_config.json config/config.json

ln -s ../ygopro .

#!/usr/bin/env bash
# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期五 3月 10, 2023 19:24:21 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io


set -e

if test -e "$HOME/.local/share/nvim/data/ultimate.db"; then
  exit
fi
if test -e "$HOME/.local/share/nvim/data/ultimate.db"; then
	exit
fi

mkdir -p "$HOME/.local/share/nvim/data"
wget https://github.com/skywind3000/ECDICT-ultimate/releases/download/1.0.0/ecdict-ultimate-sqlite.zip -O /tmp/dict.zip
unzip /tmp/dict.zip -d "$HOME/.local/share/nvim/data/" && rm  /tmp/dict.zip

cd ./speak/ && npm install && cd -
cd ./server/build/ && cmake ../ && make

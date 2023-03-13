#!/usr/bin/env bash
wget https://github.com/skywind3000/ECDICT-ultimate/releases/download/1.0.0/ecdict-ultimate-sqlite.zip -O /tmp/dict.zip
unzip /tmp/dict.zip -d "$HOME/.local/share/nvim/data/" && rm  /tmp/dict.zip

#!/usr/bin/env bash
# @author      : aero (2254228017@qq.com)
# @file        : install
# @created     : 星期五 3月 10, 2023 19:24:21 CST 
# @github      : https://github.com/denstiny
# @blog        : https://denstiny.github.io


cd ./speak/ && npm install && cd -
cd ./server/build/ && cmake ../ && make

#!/bin/bash
#miaodongdong
bashrc=$HOME"/.bashrc"
file_path=$(dirname $(readlink -f $0))
mg_path=$file_path"/mgtools.sh"
if [ ! -f "$bashrc" ]; then
	touch $bashrc
fi
echo "alias mgtools=$mg_path" >> $bashrc

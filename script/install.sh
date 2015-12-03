#!/bin/bash
#miaodongdong
bashrc=$HOME"/.bashrc"
file_path=$(dirname $(readlink -f $0))
op_path=$file_path"/optools.sh"
if [ ! -f "$bashrc" ]; then
	touch $bashrc
fi
echo "alias optools=$op_path" >> $bashrc

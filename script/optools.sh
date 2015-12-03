#!/bin/bash
#miaodongdong
file_path=$(dirname $(readlink -f $0))
module_path=$file_path"/../module"
app_path=$file_path"/../app"
CMD=""

if [ "$1" == "-a" ];then
	echo "********************all app*************************"
	CMD="ls $app_path | xargs -n1" 
  	echo $CMD | bash
elif [ "$1" == "-m" ];then
	echo "******************** module about $2 *************************"
	CMD="cat $app_path/$2" 
  	echo $CMD | bash
elif [ "$1" == "-l" ];then
	echo "******************** machine about $2*************************"
	CMD="cat $module_path/$2" 
  	echo $CMD | bash
elif [ "$1" == "-i" ];then
	CMD="cat $module_path/$2" 
	if [ "$3" == "" ];then
		echo "******************** machine about $2*************************"
  		echo $CMD | bash
	elif [ "$3" == "-c" ];then
		#CMD=$CMD" | xargs -t -I  % ssh -o \"StrictHostKeyChecking no\" % \"$4\""
		#echo $CMD | bash
		for val in `echo $CMD | bash`;do
		echo "********************$val*************************"
			ssh -o "StrictHostKeyChecking no" $val $4
		done
	elif [ "$3" == "-s" ];then
		for val in `echo $CMD | bash`;do
		echo "********************$val*************************"
			ssh -o "StrictHostKeyChecking no" $val "bash"<$4
		done
	else
	  echo "cmd not support"
	fi
else
  echo "cmd not support"
fi
#echo $LIST |  xargs  -t -d ' ' -I  % ssh -o 'StrictHostKeyChecking no' % "$1"

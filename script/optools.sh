#!/bin/bash
#miaodongdong
file_path=$(dirname $(readlink -f $0))
CMD=""
DQD_OP_LIST="/usr/bin/python /home/work/opbin/itools/modules.py list "
DQD_OP_LISTIP="/usr/bin/python /home/work/opbin/itools/modules.py listip"

if [ "$1" == "-l" ];then
	echo "******************** machine about $2*************************"
	CMD="$DQD_OP_LISTIP $2"
echo $CMD
  	echo $CMD | bash
elif [ "$1" == "-i" ];then
	CMD="$DQD_OP_LIST $2"
	if [ "$3" == "" ];then
		echo "******************** machine about $2*************************"
  		echo $CMD | bash
	elif [ "$3" == "-c" ];then
		#CMD=$CMD" | xargs -t -I  % ssh -o \"StrictHostKeyChecking no\" % \"$4\""
		#echo $CMD | bash
		for val in `echo $CMD | bash`;do
		echo "********************$val*************************"
			sudo ssh  work@$val $4
		done
	elif [ "$3" == "-s" ];then
		for val in `echo $CMD | bash`;do
		echo "********************$val*************************"
			sudo ssh  work@$val "bash"<$4
		done
	else
	  echo "cmd not support"
	fi
else
  echo "cmd not support"
fi
#echo $LIST |  xargs  -t -d ' ' -I  % ssh -o 'StrictHostKeyChecking no' % "$1"

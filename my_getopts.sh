#!/bin/bash
#存放有效的字母选项，后面紧跟冒号表示盖字母选项需要参数，开头有冒号表示去掉错误信息
optstring=":ab:cd"

#opt存放当前参数值
#OPTARG环境变量存放选项需要的参数值
#OPTIND环境变量存放参数列表getopts命令正在处理的参数位置
while getopts $optstring opt
do
	case "$opt" in
	a) echo "Found the -a option" ;;
	b) echo "Found the -b option, with value $OPTARG" ;;	
	c) echo "Found the -c option" ;;	
	d) echo "Found the -d option" ;;	
	*) echo "Unknown option: $opt" ;;
	esac
done

#移动到额外参数的地方
shift $[$OPTIND-1]
shift 4	
count=1
for param in "$@"
do
	echo "Parameter $count: $param"
	count=$[$count+1]
done

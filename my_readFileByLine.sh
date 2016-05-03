#!/bin/bash
filepath="test.c"

function readFile {
    if [ -f $filepath ]
    then
        exec 0<$filepath  #设置标准输入为目标读取文件
	    count=1
	    while read line
	    do
		    echo "line $count: $line"
		    count=$[$count+1]
	    done
    else
	    echo "$filepath doesn't exist!"
    fi
}

function readFile1 {
    if [ -f $filepath ]
    then
	    count=1
	    cat $filepath | while read line
	    do
		    echo "line $count: $line"
		    count=$[$count+1]
	    done
    else
	    echo "$filepath doesn't exist!"
    fi
}

readFile

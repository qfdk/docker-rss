#!/bin/bash

function rand(){  
    min=$1  
    max=$(($2-$min+1))  
    num=$(cat /dev/urandom | head -n 10 | cksum | awk -F ' ' '{print $1}')  
    echo $(($num%$max+$min))  
}


function stop()
{
    # stop
    rnd=$(rand 1 2)
    docker stop edge$rnd
    rnd=$(rand 1 2)
    docker stop middletier$rnd 
}

function start()
{
    # start
    rnd=$(rand 1 2)
    docker start middletier$rnd
    rnd=$(rand 1 2)
    docker start edge$rnd
}

if [ "$1" == "start" ]; then
    echo -e "\033[32m[info] Try to start ....\033[0m" 
    start
fi

if [ "$1" == "stop" ]; then
    echo -e "\033[32m[info] Try to stop ....\033[0m" 
    stop
fi
#!/bin/bash
cnn=`ss -s|awk '/TCP:/{print $2}'`

if [ $cnn -ge 50000 ];then
  echo -e "\033[31m 连接数大于5万 \033[0m"
else
  echo -e "\033[32m 连接数正常 \033[0m"
fi

disk=`df -Ph|awk '/\/$/{print $5}'|awk -F% '{print $1}'`

if [ $disk -ge 70 ];then
  echo -e "\033[31m 磁盘空间大于70% \033[0m"
else
  echo -e "\033[32m 磁盘正常 \033[0m"
fi

memtotal=`free|awk '/Mem\:/{print $2}'`
memused=`free|awk '/Mem\:/{print $3}'`
mem=`awk -v x=$memused -v y=$memtotal 'BEGIN{printf "%.2f\n",x/y*100}'|awk -F. '{print $1}'`

if [ $mem -ge 80 ];then
  echo -e "\033[31m 内存超过80%  \033[0m"
else 
  echo -e "\033[32m 内存正常 \033[0m"
fi

cpuif=`w|awk -F: '/load average/{print $NF,$1}'`

echo  -e "\033[36m$cpuif \033[0m"

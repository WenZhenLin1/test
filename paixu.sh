#!/bin/bash
read -p '请输入几个整数,空格隔开'  a
c=0
for i in $a
do
let c++
p[$c]=$i
done
b=`echo $a | awk '{print NF}'`
while [ $b -gt 0 ]
do
for g in `seq $[b-1]`
do 
if [ ${p[$b]} -lt ${p[$g]} ];then
 let x=${p[$b]}
 let p[$b]=${p[$g]}
 let p[$g]=$x
fi
done
let b--
done
echo ${p[*]}

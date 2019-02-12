#!/bin/bash
manyipaddr=`nslookup $1|awk '{if($1 ~ /Addres/ && $2 !~ /\#/)print $NF}'`
for oneipaddr in $manyipaddr
do
searchip=`grep $oneipaddr $2`
if [ ! $searchip ] 2> /dev/null ;then
  echo 'no exist'
else 
  echo 'exist'$searchip
fi
done



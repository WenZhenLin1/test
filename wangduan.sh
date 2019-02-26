#!/bin/bash
a1=$1
a2=${a1##*.}
b1=$2
b2=${b1##*.}
c=${a1%.*}
while [[ $b2 -ge $a2 ]]
do
echo "$c.$b2 营销域" >> $3
let b2--
done


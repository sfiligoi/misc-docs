#!/bin/bash
#
# Arguments:
#  fname out_prefix
#

t2=`./parse_one_bowtie2.sh "$1" 2 |tail -1 | awk '{printf("%.1f\n",$2/$1)}'`
t3=`./parse_one_bowtie2.sh "$1" 3 |tail -1 | awk '{printf("%.1f\n",$2/$1)}'`
t4=`python3 -c "print(\"%.1f, %2i%%\"%(${t2}+${t3},${t2}*100/(${t2}+${t3})))"`
echo "$2, ${t2}, ${t3}, ${t4}"

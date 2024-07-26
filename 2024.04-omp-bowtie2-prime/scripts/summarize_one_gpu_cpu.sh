#!/bin/bash
#
# Arguments:
#  fname out_prefix
#

t3=`./parse_one_gpu_cpu.sh "$1" 3 |grep Timer | head -1 | awk '{printf("%.1f\n",$3)}'`
echo "$2, ${t3}"

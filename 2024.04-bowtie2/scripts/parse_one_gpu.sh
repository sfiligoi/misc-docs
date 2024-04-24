#!/bin/bash
#
# Arguments:
#   fname timer
#

grep  -e bowtie2 "$1"  |tail -1 | awk '/bowtie/{print n " " t; print $1 " " $2 " "$3 " " $4; ;n=0;t=0}'
grep -A10  "GPU" "$1"  |grep -e "GPU" -e "Timer: $2 "

